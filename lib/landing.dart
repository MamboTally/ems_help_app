import 'package:flutter/material.dart';
import 'package:gpsmap/utils/color_utils.dart';

class Landing extends StatefulWidget {
  const Landing({ Key? key }) : super(key: key);

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EMS Help Application'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 133, 130, 130),
        elevation:0.0,
      ),
      body: Container(
         decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringToColor("CB2B93"),
            hexStringToColor("9546C4"),
            hexStringToColor("5E61F4")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 190, 20, 500),
          child:
          Stack(
            children: <Widget> [
              Container(
               padding: const EdgeInsets.only(top: 0.0, left: 20.0, right: 20.0),
                child: Column(
                 children: <Widget>[
                SizedBox(
                 height: 40.0,
                 child: Material(
                   borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.grey[850],
                    color: Colors.red[900],
                    elevation: 7.0,
                    child: GestureDetector(
                      
                      onTap: (){
                       Navigator.of(context).pushNamed('/SignInScreen');
                      },
                      child: const Center(
                        child: Text(
                          'LOGIN AS PATIENT ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                            ),
                        ),),
                    ),
                 ),
               ),
               const SizedBox(height: 65.0), 
               SizedBox(
                 height: 40.0,
                 child: Material(
                   borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.grey[850],
                    color: Colors.green[500],
                    elevation: 7.0,
                    child: GestureDetector(
                      
                      onTap: (){
                      Navigator.of(context).pushNamed('/SignIn1Screen');
                      },
                      child: const Center(
                        child: Text(
                          'LOGIN AS AMBULANCE TECHNICIAN',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                            ),
                        ),),
                    ),
                 ),
               ),
            ], 
          ),
           ),
          ],
         ),
        )
      )
      
      )   
       
    );
  }
}