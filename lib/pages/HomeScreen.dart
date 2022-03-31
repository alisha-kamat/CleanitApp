import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:cleanitapp/data/data.dart';
import 'package:cleanitapp/pages/profile_page.dart';
import 'package:cleanitapp/models/date_model.dart';
import 'package:cleanitapp/models/event_type_model.dart';
import 'package:cleanitapp/models/events_model.dart';
import 'package:cleanitapp/data/add_event.dart';
import 'package:cleanitapp/pages/Maps.dart';

class HomeScreen extends StatefulWidget {
  // HomeScreen({required this.app});
  // final FirebaseApp app;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final referenceDatabase = FirebaseDatabase.instance;

  List<DateModel> dates = <DateModel>[];
  List<EventTypeModel> eventsType = [];
  List<EventsModel> events = <EventsModel>[];


  String todayDateIs = "12";
 late DatabaseReference _EventsRef;
  @override
  void initState() {
    // TODO: implement initState
    final FirebaseDatabase database = FirebaseDatabase.instance;
     _EventsRef = database.ref().child('Events');
    super.initState();
    dates = getDates();
    eventsType = getEventTypes();
    events = getEvents();

  }




  @override
  Widget build(BuildContext context) {
    final ref = referenceDatabase.ref();
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
               color: Color(0xff102733)
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 60,horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset("assets/logo.png",height: 28,),
                        SizedBox(width: 8,),
                        Row(
                          children: <Widget>[
                            Text("Cleanit", style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w800
                            ),),
                            Text("App", style: TextStyle(
                                color: Color(0xffFCCD00),
                                fontSize: 22,
                                fontWeight: FontWeight.w800
                            ),)
                          ],
                        ),
                        Spacer(),
                        Image.asset("assets/notify.png", height: 22,),
                        SizedBox(width: 16,),
                        Image.asset("assets/menu.png", height: 22,)
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Hello, User!", style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 21
                            ),),
                            SizedBox(height: 6,),
                            Text("Let's explore where's the cleanup nearby",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15
                            ),)
                          ],
                        ),
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 3,
                              color: Color(0xffFAE072)
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: IconButton(
                                  icon: Image.asset("assets/profilepic.jpg", height: 40,),
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                                },
                              )),
                        )
                      ],
                    ),
                    // SizedBox(height: 20,),

                    /// Dates
                    Container(
                      height: 60,
                      child: ListView.builder(
                          itemCount: dates.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index){
                            return DateTile(
                              weekDay: dates[index].weekDay,
                              date: dates[index].date,
                              isSelected: todayDateIs == dates[index].date,
                            );
                          }),
                    ),

                    /// Events
                    SizedBox(height: 16,),
                    Text("All Events", style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),),
                    SizedBox(height: 16,),
                    Container(
                      height: 100,
                      child: ListView.builder(
                        itemCount: eventsType.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index){
                          return ElevatedButton(
                            child: EventTile(
                              imgAssetPath: eventsType[index].imgAssetPath,
                              eventType: eventsType[index].eventType,

                            ),
                            onPressed: (){
                              if(index==2) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Maps()));
                                }
                              else if(index==3) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Add_Event()));
                                }
                              },
                          );

                          }),
                    ),

                    /// Cleanups
                    SizedBox(height: 16,),
                    Text("Upcoming Cleanups", style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                    ),),
                     ListView.builder(
                          itemCount: events.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index){
                            return ElevatedButton(
                              child: Spacer(),
                              onPressed: (){
                               var keystr= ref
                                .child('Events')
                                    .push().key;
                                  ref.child('Events').child(keystr.toString()).child('desc')
                                    .set(events[index].desc)
                                    .asStream();
                                  ref.child('Events').child(keystr.toString()).child('imgeAssetPath')
                                    .set(events[index].imgeAssetPath)
                                    .asStream();
                                  ref.child('Events').child(keystr.toString()).child('date')
                                    .set(events[index].date)
                                    .asStream();
                                  ref.child('Events').child(keystr.toString()).child('address')
                                    .set(events[index].address)
                                    .asStream();
                                  // ref.

                              },
                            );

                            }),
                    ListView.builder(
                          itemCount: 1,
                            shrinkWrap: true,
                            itemBuilder: (context, index){
                               return Flexible(
                                   child: FirebaseAnimatedList(
                                  shrinkWrap: true,
                                  query: _EventsRef, itemBuilder: (BuildContext context,
                                  DataSnapshot snapshot,
                                  Animation animation,
                                  int index)
                              {
                                return
                                   UpcomingEventTile(

                                        desc: snapshot.child('desc').value.toString(),
                                        imgeAssetPath: snapshot.child('imgeAssetPath').value.toString(),
                                        date: snapshot.child('date').value.toString(),
                                        address: snapshot.child('address').value.toString()+index.toString(),

                                      );



                              })
                              );
                            }
                            ),


                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class DateTile extends StatelessWidget {

  String weekDay;
  String date;
  bool isSelected;
  DateTile({required this.weekDay,required this.date,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xffFCCD00) : Colors.transparent,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(date, style: TextStyle(
            color: isSelected ? Colors.black : Colors.white,
            fontWeight: FontWeight.w600
          ),),
          SizedBox(height: 10,),
          Text(weekDay, style: TextStyle(
              color: isSelected ? Colors.black : Colors.white,
              fontWeight: FontWeight.w600
          ),)
        ],
      ),
    );
  }
}

class EventTile extends StatelessWidget {

  String imgAssetPath;
  String eventType;
  EventTile({required this.imgAssetPath,required this.eventType});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 30),
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Color(0xff29404E),
        borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(imgAssetPath, height: 27,),
          SizedBox(height: 12,),
          Text(eventType, style: TextStyle(
            color: Colors.white
          ),)
        ],
      ),
    );
  }
}

class UpcomingEventTile extends StatelessWidget {

  String desc;
  String date;
  String address;
  String imgeAssetPath;/// later can be changed with imgUrl
  UpcomingEventTile({required this.address,required this.date,required this.imgeAssetPath,required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Color(0xff29404E),
        borderRadius: BorderRadius.circular(8)
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 16),
              width: MediaQuery.of(context).size.width - 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(desc, style: TextStyle(
                      color: Colors.white,
                    fontSize: 18
                  ),),
                  SizedBox(height: 8,),
                  Row(
                    children: <Widget>[
                      Image.asset("assets/calender.png", height: 12,),
                      SizedBox(width: 8,),
                      Text(date, style: TextStyle(
                          color: Colors.white,
                          fontSize: 10
                      ),)
                    ],
                  ),
                  SizedBox(height: 4,),
                  Row(
                    children: <Widget>[
                      Image.asset("assets/location.png", height: 12,),
                      SizedBox(width: 8,),
                      Text(address, style: TextStyle(
                        color: Colors.white,
                        fontSize: 10
                      ),)
                    ],
                  ),
                ],
              ),
            ),
          ),
          ClipRRect(
              borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
              child: Image.asset(imgeAssetPath, height: 200,width: 120, fit: BoxFit.cover,)),
        ],
      ),
    );
  }
}



