import 'package:cleanitapp/services/markerInfo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cleanitapp/pages/profile_page.dart';
import 'location_service.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cleanitapp/screens/objClass/MapArguments.dart';
import 'package:cleanitapp/pages/UploadPage.dart';
import 'package:cleanitapp/data/add_event.dart';

class Maps extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  CollectionReference markInformation = FirebaseFirestore.instance.collection('markerInfo');
  late GoogleMapController newGoogleMapController;
  late double lat,lng;
  Set<Marker> _markers = {};
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  double bottompaddingOfPadding = 0;
  late Position currentPos;
  var geoLocator = Geolocator();
  void locatePosition()async{
    Position position=await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    currentPos=position;
    LatLng latLngPos = LatLng(position.latitude, position.longitude);
    print(position.latitude);
    lat=position.latitude;
    lng=position.longitude;
    print(position.longitude);
     CameraPosition cameraPosition = new CameraPosition(
      target: latLngPos,
      zoom: 14,
    );
     newGoogleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  CameraPosition _kGooglePlex = CameraPosition(
  target: LatLng(37.42796133580664, -122.085749655962),
  zoom: 84.4746,
  );

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
      body: Stack(
        children: [
           GoogleMap(
              padding: EdgeInsets.only(bottom: bottompaddingOfPadding,top: bottompaddingOfPadding),
              mapType: MapType.hybrid,
              myLocationButtonEnabled: true,
              initialCameraPosition: _kGooglePlex,
              myLocationEnabled: true,
              zoomControlsEnabled: true,
              zoomGesturesEnabled: true,
              onMapCreated: OnMapCreation,
             markers: _markers,
            ),
          Positioned(
            top: 45.0,
            left: 22.0,
            child: GestureDetector(
              onTap: (){
                scaffoldKey.currentState?.openDrawer();
              },
              child: Column(
                children: [
                  SizedBox(height: 100,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 6.0,
                          spreadRadius: 0.5,
                          offset: Offset(
                            0.7,
                            0.7,
                          )
                        ),
                      ],
                    ),

                    child: IconButton(
                      // backgroundColor: Colors.white,
                      icon: Icon(Icons.add, color: Colors.black),
                      // radius: 20.0,
                      onPressed: ()async{
                        // locatePosition();
                        // string uniquekey="";
                        // String info = markInformation.add({}).toString();
                        // await markInformation.add(
                        //     {
                        //       'latitude': lat,
                        //       'longitude': lng,
                        //     }).then((value) => "Trash Info Updated");
                        // print(lat);
                        // print(lng);
                        // Navigator.push(
                        //   context,
                        //   '/ProfilePage'
                        // );
                        // Navigator.pushReplacementNamed(context, '/ProfilePage',
                        // arguments: {
                        //   'latitude': lat,
                        //   'longitude': lng
                        // });
                        // Route route = new MaterialPageRoute(builder: (context) => UploadPage());
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => Add_Event()));
                        // addMarker(lat,lng,newGoogleMapController);

                      },

                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void addMarker(double lat, double lng) {
    print(lat);
    print(lng);
    _markers.add(
      Marker(

        markerId: MarkerId('id-1'),
        position: LatLng(lat,lng)
      )

    );
    // OnMapCreation(controller);
  }

  void OnMapCreation(GoogleMapController  controller) {
    // ;
    _controllerGoogleMap.complete(controller);
    newGoogleMapController=controller;
    setState(() {
      bottompaddingOfPadding = 265.0;
    });
    locatePosition();
    addMarker(lat, lng);
  }
}