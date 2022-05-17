import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gpsmap/landing.dart';
// import 'package:gpsmap/screens/signin_screen.dart';
//import 'package:gpsmap/onroad_model.dart';
//import 'package:google_map_live/mymap.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';




class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final loc.Location location = loc.Location();
  StreamSubscription<loc.LocationData>? _locationSubscription;

  @override
  void initState() {
    super.initState();
    _requestPermission();
    location.changeSettings(interval: 300, accuracy: loc.LocationAccuracy.high);
    location.enableBackgroundMode(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 62, 63, 63),
      appBar: AppBar(
        title: const Text('Emergency Ambulance...'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 133, 130, 130),
        elevation:0.0,
      ),
      body: Center(
          child: Card(
             elevation: 20,
             color: Colors.transparent,
             borderOnForeground: true,
           margin: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 290.0), 
               child: Column(
        children: [
          TextButton(
              onPressed: () {
                _getLocation();
              },
              style: TextButton.styleFrom(
              primary: Colors.greenAccent,
              // Text Color
               ),
              child: const Text('add my location'),
             ),
          TextButton(
              onPressed: () {
                _listenLocation();
              },
              style: TextButton.styleFrom(
              primary: Colors.orange// Text Color
               ),
              child: const Text('enable live location')),
          TextButton(
              onPressed: () {
                _stopListening();
              },
              style: TextButton.styleFrom(
              primary: Colors.red// Text Color
               ),
              child: const Text('stop live location')),
          // Expanded(
          //     child: StreamBuilder(
          //   stream:
          //       FirebaseFirestore.instance.collection('location').snapshots(),
          //   builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          //     if (!snapshot.hasData) {
          //       return const Center(child: CircularProgressIndicator());
          //     }
          //     return ListView.builder(
          //         itemCount: snapshot.data?.docs.length,
          //         itemBuilder: (context, index) {
          //           return ListTile(
          //             // title:
          //             //     Text(snapshot.data!.docs[index]['name'].toString()),
          //             subtitle: Row(
          //               children: [
          //                 Text(snapshot.data!.docs[index]['latitude']
          //                     .toString()),
          //                 const SizedBox(
          //                   width: 20,
          //                 ),
          //                 Text(snapshot.data!.docs[index]['longitude']
          //                     .toString()),
          //               ],
          //             ),
          //             trailing: IconButton(
          //               icon: const Icon(Icons.directions),
          //               onPressed: () {
          //                 Navigator.of(context).push(MaterialPageRoute(
          //                     builder: (context) =>
          //                         MyMap(snapshot.data!.docs[index].id)));
          //               },
          //             ),
          //           );
          //         });
          //   },
          // )
          // ),
        ],
      ),
          ),
        ),
         floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
            FirebaseAuth.instance.signOut().then((value) {
              print("Signed Out");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Landing()));
            });
         },
        label: const Text('Logout'),
         icon: const Icon(Icons.home),
         backgroundColor: const Color.fromARGB(255, 133, 130, 130),
         hoverColor: Colors.orange,
       ),
      );
      
  }

  _getLocation() async {
    try {
      final loc.LocationData _locationResult = await location.getLocation();
      await FirebaseFirestore.instance.collection('location').doc('user1').set({
        'latitude': _locationResult.latitude,
        'longitude': _locationResult.longitude,
        //'name': 'Patient'
      }, SetOptions(merge: true));
    } catch (e) {
      debugPrint('e');
    }
  }

  Future<void> _listenLocation() async {
    _locationSubscription = location.onLocationChanged.handleError((onError) {
      debugPrint(onError);
      _locationSubscription?.cancel();
      setState(() {
        _locationSubscription = null;
      });
    }).listen((loc.LocationData currentlocation) async {
      await FirebaseFirestore.instance.collection('location').doc('user1').set({
        'latitude': currentlocation.latitude,
        'longitude': currentlocation.longitude,
        //'name': 'Patient'
      }, SetOptions(merge: true));
    });
  }

  _stopListening() {
    _locationSubscription?.cancel();
    setState(() {
      _locationSubscription = null;
    });
  }

  _requestPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      debugPrint('done');
    } else if (status.isDenied) {
      _requestPermission();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }
}