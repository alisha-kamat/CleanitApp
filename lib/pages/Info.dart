import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import '../services/Instruction_obj.dart';
import 'SignUp.dart';
class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {

  List <Instruction> instr = [
    Instruction(Image: 1, Topic: "Don't pay the price, keep your city nice. Don't litter.", Description: "We aim to provide awareness of how much we are wasting every day.We want to make a statement that we could reuse this waste as we recycle it.This is for us to teach them and make it as “persuasive” as possible for them to participate.", isVisible: false,Height_box: 120.0),
    Instruction(Image: 2, Topic: "Health and hygiene – Better than wealth and digene.", Description: "To promote waste reduction, recycling and reuse and create public awareness on waste management and environmental concerns.To improve outdoor recreational activities of the community.", isVisible: true , Height_box: 78.0),
    Instruction(Image: 3, Topic: "Let us go green to get our planet clean.", Description: "To help reduce the greenhouse gases and fight climate change; improving the quality of the natural environment. To set one’s mind on the well-being of future generation.", isVisible: true , Height_box: 103.0),
  ];
  // final Color clr = Colors.transparent;
  int index = 0;
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
              children: <Widget>[
                SizedBox(height: instr[index].Height_box), //150 80 80
                Image.asset('assets/Info${instr[index].Image}.png'),
                SizedBox(height: 50.0,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    '${instr[index].Topic}',
                      textAlign: TextAlign.center,
                    style:GoogleFonts.abel(
                        textStyle: TextStyle(
                            color:Colors.black,
                            fontSize: 32.0,
                          fontWeight: FontWeight.bold
                        )
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                      '${instr[index].Description} ',
                      textAlign: TextAlign.center,
                    style:GoogleFonts.abel(
                        textStyle: TextStyle(
                            color:Colors.black,
                            fontSize: 15.0
                        )
                    )
                  ),
                ),
                SizedBox(height: 25.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end ,
                  children: <Widget>[
                    Visibility(
                      visible: instr[index].isVisible,
                      replacement: Ink(
                         decoration:  const ShapeDecoration(
                          color:  Colors.transparent,
                          shape: CircleBorder(),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Ink()

                          ),
                      ),
                      child: Ink(

                        decoration:  const ShapeDecoration(
                        color:  Colors.black,
                        shape: CircleBorder(),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(

                            icon: const Icon(Icons.arrow_back_ios),

                            tooltip: 'Proceed',
                            onPressed: () {
                              setState(() {
                                if(index!= 0){
                                  index-=1;
                                }
                              });

                            },

                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 215,), //215
                    Ink(
                      decoration:  const ShapeDecoration(
                      color: Colors.black,
                      shape: CircleBorder(),
                    ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_forward_ios),
                          tooltip: 'Proceed',
                          onPressed: () {
                            setState(() {
                              if(index!= 2){
                                index+=1;
                              }
                              else{
                                Route route = MaterialPageRoute(builder: (context) => SignUp());
                                  Navigator.pushReplacement(context, route);
                              }
                            });

                          },

                        ),
                      ),
                    ),


                  ],
                ),

              ],
            ),
          ),
        ),
      );

  }
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

