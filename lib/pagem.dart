//import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gpsmap/landing.dart';
import 'package:gpsmap/onroad_model.dart';
// import 'package:gpsmap/screens/signin_screen.dart';
//import 'package:google_map_live/mymap.dart';
//import 'package:location/location.dart' as loc;
//import 'package:permission_handler/permission_handler.dart';

class Map extends StatefulWidget {
  const Map({ Key? key }) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 62, 63, 63),
       appBar: AppBar(
        title: const Text('Emergency Ambulance...'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 133, 130, 130),
        elevation:0.0,
       ),
        body: Row(
              children: 
                   [ 
                     Expanded(
                      child: StreamBuilder(
                         stream:
                             FirebaseFirestore.instance.collection('location').snapshots(),
                              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (!snapshot.hasData) {
                                 return const Center(child: CircularProgressIndicator());
                                }
                                return ListView.builder(
                                itemCount: snapshot.data?.docs.length,
                                itemBuilder: (context, index) {
                                return ListTile(
                              // title:
                             //     Text(snapshot.data!.docs[index]['name'].toString()),
                              subtitle: Row(
                              children: [
                              Text(snapshot.data!.docs[index]['latitude']
                               .toString()),
                              const SizedBox(
                              width: 20,
                            ),
                            Text(snapshot.data!.docs[index]['longitude']
                              .toString()),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.directions),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  MyMap(snapshot.data!.docs[index].id)));
                        },
                      ),
                    );
                  });
            },
          )
          ),
       ],
     ),
     floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
            await FirebaseAuth.instance.signOut().then((value) {
              print("Signed Out");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Landing()));
            });
            setState(() {});
         },
        label: const Text('Logout'),
         icon: const Icon(Icons.home),
         backgroundColor: const Color.fromARGB(255, 133, 130, 130),
         hoverColor: Colors.orange,
       ),
    );
  }
}


