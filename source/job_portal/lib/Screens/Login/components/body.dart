import 'package:flutter/material.dart';
import 'package:job_portal/Screens/Login/components/background.dart';
import 'package:job_portal/Screens/Signup/signup_screen.dart';
import 'package:job_portal/components/already_have_an_account_acheck.dart';
import 'package:job_portal/components/rounded_button.dart';
import 'package:job_portal/components/rounded_input_field.dart';
import 'package:job_portal/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

import '../../Home/home_screen.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            Container
              (
              alignment: Alignment.center,
                child: RoundedInputField(
              hintText: "Your Email",
              icon:Icons.person,
              onChanged: (value) {}
                )
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen();
                    },
                  ),
                );
              }
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
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
          ],
        ),
      ),
    );
  }
}