import 'package:flutter/material.dart';
import 'package:job_portal/Screens/Welcome/welcome_screen.dart';
import 'package:job_portal/constants.dart';

void main() =>   runApp(MyApp());

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job Portal',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
    );
  }
}


