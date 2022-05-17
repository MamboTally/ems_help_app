import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gpsmap/infor.dart';
import 'package:gpsmap/landing.dart';
import 'package:gpsmap/map.dart';
import 'package:gpsmap/pagem.dart';
import 'package:gpsmap/screens/reset_password.dart';
import 'package:gpsmap/screens/signin_ambulance_screen.dart';
import 'package:gpsmap/screens/signin_screen.dart';
import 'package:gpsmap/screens/signup_ambulance_screen.dart';
import 'package:gpsmap/screens/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(  
    routes: {
      '/': (context) =>  const Landing(),
      '/SignUpScreen': (context) =>  const SignUpScreen(),
      '/Infor': (context) =>  const Infor(),
      '/ResetPassword': (context) =>  const ResetPassword(),
      '/SignInScreen': (context) =>  const SignInScreen(),
      '/SignIn1Screen': (context) =>  const SignIn1Screen(),
      '/SignUp1Screen': (context) =>  const SignUp1Screen(),
      '/MyApp': (context) =>  const MyApp(),
      '/Map': (context) =>  const Map(),
    },
  ));
}

