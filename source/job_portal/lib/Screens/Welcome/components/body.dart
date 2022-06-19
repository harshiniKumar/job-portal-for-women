import 'package:flutter/material.dart';
import 'package:job_portal/Screens/Signup/signup_screen.dart';
import 'package:job_portal/Screens/Login/login_screen.dart';
import 'package:job_portal/Screens/Welcome/components/background.dart';
import 'package:job_portal/components/rounded_button.dart';
import 'package:job_portal/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:job_portal/Screens/Events/events_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "WELCOME TO SHERO SEARCH",
              style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Varela-Round'),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset("assets/icons/chat.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
            // RoundedButton(
            //   text: "EVENTS",
            //   color: kPrimaryLightColor,
            //   textColor: Colors.black,
            //   press: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) {
            //           return EventScreen();
            //         },
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}