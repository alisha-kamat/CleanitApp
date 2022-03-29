import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'Maps.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  String name='';
  String password = '';
  bool isPasswordVisible = false;
  @override
  void initState(){
    super.initState();
    emailController.addListener(()=>setState(() {

    }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(

        title: Text(
          'CleanitApp',
          style: TextStyle(
            color: Colors.white,
          ),
        ),

        backgroundColor: Colors.transparent,
      ),
      body: CustomPaint(
        painter: BluePainter(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0,32.0,20.0,0.0),
          child: Column(
            children: [
              const SizedBox(height: 125,),
              Text(
                  'Hello!',
              style:GoogleFonts.abel(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 64.0
                ),
              )

              ),
              const SizedBox(height: 20,),
            buildName() ,

              const SizedBox(height: 24,),
              buildEmail(),
              const SizedBox(height: 24,),
          ElevatedButton(

            onPressed: () {

              print('Email: ${emailController.text}');
              // print('Password: ${password}');
              print('Name: ${name}');
              Route route = MaterialPageRoute(builder: (context) => Maps());
              Navigator.pushReplacement(context, route);
            },
            child: const Text('Submit'),
          ),
            ],
          ),
        ),
      ),
    );

  }

  Widget buildEmail() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Email', style: TextStyle(fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      TextField(
        controller: emailController,
        decoration: InputDecoration(
          hintText: 'name@example.com',
          hintStyle: TextStyle(color: Colors.white),
          filled: true,
          fillColor: Colors.black,
          prefixIcon: Icon(Icons.mail),
          // icon: Icon(Icons.mail),
          suffixIcon: emailController.text.isEmpty
            ? Container(width: 0,):
          IconButton(
            icon: Icon(Icons.close),
            onPressed:() =>  emailController.clear(),
          ),
          border: OutlineInputBorder(),
        ),
        style: TextStyle(color: Colors.white),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
      ),
    ],
  );
  Widget buildPassword() => TextField(
    onChanged: (value)=>setState(() => this.password=value),
    onSubmitted: (value)=>setState(() => this.password=value),

    decoration: InputDecoration(
      hintText: 'Your Password',
      // hint
      // labelText: 'Password',
      filled: true,
      fillColor: Colors.black,

      suffixIcon: IconButton(
        icon: isPasswordVisible
        ? Icon(Icons.visibility_off)
        :Icon(Icons.visibility),
        onPressed: ()=>
        setState(()=> isPasswordVisible = !isPasswordVisible),
      ),
      border: OutlineInputBorder(),
    ),
    obscureText: isPasswordVisible,

  );

 Widget buildName() =>Column(
   crossAxisAlignment: CrossAxisAlignment.start ,
   children: [
     Text('Name', style: TextStyle(fontWeight: FontWeight.bold)),
     const SizedBox(height: 8),
     TextField(

       decoration: InputDecoration(
         hintText: 'Enter your Name',
         hintStyle: TextStyle(color: Colors.white),
         prefixIcon: Icon(Icons.person),

         filled: true,
         fillColor: Colors.black,
         border: OutlineInputBorder(),
       ),
       style: TextStyle(color: Colors.white),

     ),
   ],
 );
}


class BluePainter extends CustomPainter{
  void paint(Canvas canvas ,Size size){
    final height = size.height;
    final width = size.width;
    Paint paint1 = Paint();
    Paint paint2 = Paint();
    Paint paint3 = Paint();
    Paint paint4= Paint();
    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    paint1.color = Color(0xFFBBD7F1FF);
    canvas.drawPath(mainBackground, paint1);
    // topLeft Circle
    Path ovalPath = Path();
    ovalPath.moveTo(width*0.5, 0);
    ovalPath.quadraticBezierTo(width*0.7, height *0.15, width, height* 0.2);
    // ovalPath.quadraticBezierTo(width*0.6, height *0.8, width*0.1, height);
    ovalPath.lineTo(width,0);
    ovalPath.close();
    paint2.color = Color(0xFF5F0266FF).withOpacity(0.3); //03296DFF
    canvas.drawPath(ovalPath, paint2);

    //BottomRight Circle 1
    Path ovalPath2 = Path();
    ovalPath2.moveTo(0, 0.70*height);
    ovalPath2.quadraticBezierTo(width*0.35, height *0.8, width*0.20, height);
    ovalPath2.lineTo(0,height);
    ovalPath2.close();
    paint3.color = Color(0xFF5F0266FF).withOpacity(0.3);//
    canvas.drawPath(ovalPath2, paint3);

    //BottomRight Circle 1
    Path ovalPath3= Path();
    ovalPath3.moveTo(0, 0.9*height);
    ovalPath3.quadraticBezierTo(width*0.40, height *0.8, width*0.65, height);
    ovalPath3.lineTo(0,height);
    ovalPath3.close();
    paint3.color = Color(0xFF5906B8FF).withOpacity(0.4); //
    canvas.drawPath(ovalPath3, paint3);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate){
    return oldDelegate != this;
  }
}
