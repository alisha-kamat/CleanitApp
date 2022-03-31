import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:async';
import 'dart:io';
import 'package:cleanitapp/screens/objClass/MapArguments.dart';
import 'package:cleanitapp/pages/HomeScreen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';


class UploadPage extends StatefulWidget {
  static const routeName = '/UploadPage';
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final referenceDatabase = FirebaseDatabase.instance;
  TextEditingController dateinput = TextEditingController();
  TextEditingController nameInput = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController volunteers = TextEditingController();
  File? _image;
  late DatabaseReference _EventsRef;
  @override
  void initState() {
    final FirebaseDatabase database = FirebaseDatabase.instance;
    _EventsRef = database.ref().child('Events');
    dateinput.text = ""; //set the initial value of text field
    dateinput.text = ""; //set the initial value of text field
    dateinput.text = ""; //set the initial value of text field
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

// final fileName = _image!=null? basename(_image!.path):'No File'
    // final args = ModalRoute.of(context)!.settings.arguments as MapArguments;
    final ref = referenceDatabase.ref();
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
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left:30.0, top:20.0,right:30.0,bottom:20.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 150),
                  IconButton(
                    icon: CircleAvatar(
                      radius: 55,
                      // backgroundColor: Colors.lightBlue,
                      child: _image != null
                          ? ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.file(
                          _image!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      )
                          : Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(50)),
                        width: 100,
                        height: 100,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                    onPressed: (){
                      _showPicker(context);

                    },
                  ),
                  SizedBox(height: 64),
                  TextField(
                    onChanged: (value)=>setState(() {
                      nameInput.text=value;
                    }),
                    onSubmitted: (value)=>setState(() {
                      nameInput.text=value;
                    }),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Title',
                    ),
                  ),
                  SizedBox(height: 32,),
                  TextField(
                    onChanged: (value)=>setState(() {
                      desc.text=value;
                    }),
                    onSubmitted: (value)=>setState(() {
                      desc.text=value;
                    }),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Description',
                      isDense: true,                      // Added this
                    ),
                  ),
                  SizedBox(height: 32,),

                  TextField(
                    onChanged: (value)=>setState(() {
                      dateinput.text=value;
                    }),
                    onSubmitted: (value)=>setState(() {
                      dateinput.text=value;
                    }),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      //icon: Icon(Icons.calendar_today),
                      labelText: 'Enter Date',
                      isDense: true,
                    ),
                    //readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2022), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101)
                      );

                      if(pickedDate != null ){
                        print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(formattedDate); //formatted date output using intl package =>  2021-03-16
                        //you can implement different kind of Date Format here according to your requirement

                        setState(() {
                          dateinput.text = formattedDate.toString();
                          //set output date to TextField value.
                        });
                      }else{
                        print("Date is not selected");
                      }
                    },
                  ),
                  SizedBox(height: 32,),
                  TextField(
                    onChanged: (value)=>setState(() {
                      address.text=value;
                    }),
                    onSubmitted: (value)=>setState(() {
                      address.text=value;
                    }),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Location',
                      isDense: true,                      // Added this
                    ),
                  ),
                  SizedBox(height: 32,),
                  TextField(
                    onChanged: (value)=>setState(() {
                      volunteers.text=value;
                    }),
                    onSubmitted: (value)=>setState(() {
                      volunteers.text=value;
                    }),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Total Volunteers needed',
                      isDense: true,                      // Added this
                    ),
                  ),
                  SizedBox(height: 64,),
                  Center(child: ElevatedButton(
                    child:Text('Upload'),
                    onPressed: () {

                      var keystr= ref
                          .child('Events')
                          .push().key;
                      ref.child('Events').child(keystr.toString()).child('desc')
                          .set(nameInput.text)
                          .asStream();
                      ref.child('Events').child(keystr.toString()).child('info')
                          .set(desc.text)
                          .asStream();
                      ref.child('Events').child(keystr.toString()).child('imgeAssetPath')
                          .set("assets/uncleanStreets.jpg")
                          .asStream();
                      ref.child('Events').child(keystr.toString()).child('date')
                          .set(dateinput.text)
                          .asStream();
                      ref.child('Events').child(keystr.toString()).child('address')
                          .set(address.text)
                          .asStream();
                      ref.child('Events').child(keystr.toString()).child('volunteers')
                          .set(volunteers.text)
                          .asStream();
                      Navigator.pop(context);
                    },
                  )),
                ],
              ),
            ),
          ),
        )
    );
  }


  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      pickImageFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
  Future pickImageFromCamera() async {
    File image = (await ImagePicker().pickImage(source: ImageSource.camera)) as File;
    setState(() {
      _image = image;
    });
  }


  _imgFromGallery() async {
    File image = (await ImagePicker().pickImage(
        source: ImageSource.gallery, imageQuality: 50
    )) as File;

    setState(() {
      _image = image;
    });
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