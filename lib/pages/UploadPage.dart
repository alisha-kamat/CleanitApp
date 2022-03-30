import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'package:cleanitapp/screens/objClass/MapArguments.dart';


class UploadPage extends StatefulWidget {
  static const routeName = '/UploadPage';
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  TextEditingController dateinput = TextEditingController();
  File? _image;
  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as MapArguments;

    return Scaffold(
        appBar: AppBar(title: Text("CleanitApp"),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.only(left:30.0, top:20.0,right:30.0,bottom:20.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 32),
              CircleAvatar(
                radius: 55,
                backgroundColor: Colors.lightBlue,
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
              SizedBox(height: 32),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Title',
                ),
              ),
              SizedBox(height: 16,),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Description',
                  isDense: true,                      // Added this
                ),
              ),
              SizedBox(height: 16,),

              TextField(
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
                      dateinput.text = formattedDate; //set output date to TextField value.
                    });
                  }else{
                    print("Date is not selected");
                  }
                },
              ),
              SizedBox(height: 16,),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Location',
                  isDense: true,                      // Added this
                ),
              ),
              SizedBox(height: 16,),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Total Volunteers needed',
                  isDense: true,                      // Added this
                ),
              ),
              SizedBox(height: 16,),
              Center(child: buildUpgradeButton()),
            ],
          ),
        )
    );
  }
  Widget buildUpgradeButton() => ElevatedButton(
    child:Text('upload'),
    onPressed: () {},
  );

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

