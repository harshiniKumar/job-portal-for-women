import 'package:flutter/material.dart';
import 'package:job_portal/Screens/Welcome/components/body.dart';
import 'package:job_portal/constants.dart';

class WelcomeScreen extends StatelessWidget {
  String dropdownValue = 'Option 1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('SHERO SEARCH' ),
        backgroundColor: kPrimaryColor,
        actions: [
          PopupMenuButton(
          icon: Icon(Icons.more_vert),
          itemBuilder: (BuildContext context) => <PopupMenuEntry>[
            const PopupMenuItem(
              child: ListTile(
                title: Text('English'),
              ),
            ),
            const PopupMenuItem(
              child: ListTile(
                title: Text('Tamil'),
              ),
            ),
            const PopupMenuItem(
              child: ListTile(
                title: Text('Hindi'),
              ),
            ),
        ],
      )],
      ),
      body: Body(),
    );
  }
}