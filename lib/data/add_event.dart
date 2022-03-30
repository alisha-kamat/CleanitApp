
import 'package:flutter/material.dart';

class Add_Event extends StatefulWidget {
  const Add_Event({Key? key}) : super(key: key);

  @override
  _Add_EventState createState() => _Add_EventState();
}

class _Add_EventState extends State<Add_Event> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: ListView(
          children: <Widget>[
            imageProfile()
          ],
        ),
      ),
    );
  }

  imageProfile() {
    return Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 80.0,
          backgroundImage: AssetImage("assets/img.png"),
        ),
        Positioned(
            bottom: 20.0,
            right: 20.0,
            child: InkWell(
              onTap: (){},
              child: Icon(
                Icons.camera_alt,
                color: Colors.teal,
                size: 28.0,
              ),
            ),

        )
      ],
    );
  }
}
Widget bottomSheet(){
  return Container(
    height: 100.0,
    // width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 20,
    ),
    child: Column(children: <Widget>[
      Text(
          "Choose Profile Photo",
        style: TextStyle(

        ),

      )

    ],
    ),
  );
}