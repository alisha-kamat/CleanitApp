import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            transform: Matrix4.translationValues(0, -25, 0),
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/event1.webp'),
                      )),
                ),
                Positioned(
                  right: 10,
                  left: 10,
                  top: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.keyboard_backspace,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      CircleAvatar(
                        radius: 32,
                        backgroundColor: Color(0xffde554d),
                        child: Text(
                          '24 Apr',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  left: 10,
                  right: 10,
                  bottom: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Versova Beach Cleanup',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            '21 tonn',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),

                          ),
                          Text(
                            'waste',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 15,
                        ),
                        Text(
                          'link to map',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                    Text(
                      '7Am - 1PM',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '112 Participants',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '1 day duration',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Material(
                    color: Color(0xffde554d),
                    child: MaterialButton(
                      child: Text(
                        'REGISTER',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'About',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Versova Beach is in the Andheri suburb, and it is among the least visited beaches in Mumbai. Because of occasional strong currents and high tides, swimming in the water is prohibited. However, nothing can stop you from admiring the sunset from the shore on a rather slumber evening.The 3 km long rocky Versova Beach faces the Arabian Sea, and people also visit the place in the hope to capture some Olive Ridley turtles in their lens. Horse-riding and cycling are the other activities available at Versova, apart from satisfying the urges of beach photography.',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          )
        ],
      ),
    );
  }

}
