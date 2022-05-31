// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:job_portal/Screens/Login/login_screen.dart';
import 'package:job_portal/Screens/Signup/components/background.dart';
import 'package:job_portal/Screens/Signup/components/or_divider.dart';
import 'package:job_portal/Screens/Signup/components/social_icon.dart';
import 'package:job_portal/components/already_have_an_account_acheck.dart';
import 'package:job_portal/components/rounded_button.dart';
import 'package:job_portal/components/rounded_input_field.dart';
import 'package:job_portal/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.25,
            ),
            RoundedInputField(
              hintText: "Name",
              icon:Icons.abc,
              onChanged: (value){},
              ),
            RoundedInputField(
              hintText: "Phone Number",
              icon:Icons.phone_android,
              onChanged: (value){},
            ),
            RoundedInputField(
              hintText: "Your Email",
              icon:Icons.person,
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
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
          ],
        ),
      ),
    );
  }
}