import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:gpsmap/utils/color_utils.dart';

class Infor extends StatefulWidget {
  const Infor({ Key? key }) : super(key: key);

  @override
  State<Infor> createState() => _InforState();
}
List<String> recipent = ["0777557180", "0718760356"];

class _InforState extends State<Infor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("CB2B93"),
          hexStringToColor("9546C4"),
          hexStringToColor("5E61F4")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
         child: SingleChildScrollView(
           child: Card(
             borderOnForeground: true,
           margin: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 120.0),
           child: Column(
                 children: const <Widget> [
                   Text(
                     'Health Tips Dos and Donts', style: TextStyle(decoration: TextDecoration.underline, fontSize: 20, fontWeight: FontWeight.bold, backgroundColor: Color.fromARGB(255, 240, 240, 240), color: Colors.black,),),
                     SizedBox(height: 20),
                       Text('1. Do tell the Ambulance Technician operator where you are by clicking add  live location. ', style: TextStyle(fontSize: 14, color: Colors.black),),
                       SizedBox(height: 10),
                       Text('2. Do remain calm and keep the person safe until the ambulance arrive.  ', style: TextStyle(fontSize: 14, color: Colors.black),),
                       SizedBox(height: 10),
                       Text('3. Do tell emergency responders about the person symptoms through texting by clicking send text.', style: TextStyle(fontSize: 14, color: Colors.black),),
                       SizedBox(height: 10),
                       Text('4. Do perform CPR if the person is not breathing.', style: TextStyle(fontSize: 14, color: Colors.black),),
                       SizedBox(height: 10),
                       Text('5. Do unlock the front door so paramedics can enter quickly. ', style: TextStyle(fontSize: 14, color: Colors.black),),
                       SizedBox(height: 10),
                       Text('6. Do not drive the person in need to the hospital yourself. ', style: TextStyle(fontSize: 14, color: Colors.black),),
                       SizedBox(height: 10),
                       Text('7. Do not provide any medication unless instructed. ', style: TextStyle(fontSize: 14, color: Colors.black),),
                       SizedBox(height: 10),
                       Text('8. Do not provide anything to eat or drink unless instructed. ', style: TextStyle(fontSize: 14, color: Colors.black),),
                       SizedBox(height: 10),
                       Text(' EMS (Emergency Medical Services) clinicians (including emergency medical responders (EMR), emergency medical technicians (EMTs), advanced EMTs (AEMTs), paramedics, and other medical first responders who could be providing patient care in the field, such as law enforcement and fire service personnel), managers of 9-1-1 ECC/PSAPS, EMS agencies, EMS systems, and agencies with medical first responders.)', style: TextStyle(fontSize: 10, fontStyle: FontStyle.italic),),
                        SizedBox(height: 10),
                 ],
           ),
           ),
          //  child: Center(
          //    child: Padding(
          //      padding: const EdgeInsects.all(8.0),
          //      child: RaisedButton(
          //        color: Theme.of(context).accentColor,
          //        padding: EdgeIsects.symmetric(vertical: 16),
          //        child: Text("Send SmS"),
          //        style: Theme.of(context).accentTextTheme.button,
          //        onPressed: (){
          //          _sendSMS("This is a text message", recipent);
          //        },
          //      ),
          //    )
          //  ),
         ), 
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     // Add your onPressed code here!
      //   },
      //   label: const Text('Text'),
      //   icon: const Icon(Icons.mail),
      //   backgroundColor: const Color.fromARGB(255, 71, 71, 71),
      //   hoverColor: Colors.orange,
      //),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     // Add your onPressed code here!
      //   },
      //   label: const Text('SMS'),
      //   icon: const Icon(Icons.mail),
      //   backgroundColor: const Color.fromARGB(255, 71, 71, 71),
      //   hoverColor: Colors.orange,
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
      FloatingActionButton(
        heroTag: const Text("btn1"),
        backgroundColor: const Color.fromARGB(255, 71, 71, 71),
        hoverColor: Colors.orange,
        onPressed: () {
          _sendSMS("This is a text message", recipent);
        },
        child: const Icon(
          Icons.mail,
          ),
      ),
      FloatingActionButton(
         heroTag: const Text("btn2"),
         backgroundColor: const Color.fromARGB(255, 7, 230, 7),
        onPressed: () {
           Navigator.of(context).pushNamed('/MyApp');
        },
        child: const Icon(Icons.arrow_forward),
      )
    ],
  ),
)
    );
  }
}
void _sendSMS(String message, List<String> recipents) async{
   String _result =await sendSMS(message: message, recipients: recipents)
  .catchError((onError) {
    debugPrint(onError);
  });
   debugPrint(_result);
}