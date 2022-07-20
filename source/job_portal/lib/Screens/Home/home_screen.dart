// ignore_for_file: unnecessary_new

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:job_portal/Screens/Events/events_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_portal/Screens/Jobs/job_screen.dart';
import 'package:job_portal/Screens/Profile/profile_screen.dart';
import '../../../constants/constants.dart';
class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class HomeScreen extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Home", Icons.home),
    new DrawerItem("Profile",Icons.person),
    new DrawerItem("Jobs ", Icons.work),
    new DrawerItem("Grievance platform", Icons.comment),
    new DrawerItem("Events", Icons.calendar_month)
  ];

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}
class HomeScreenState extends State<HomeScreen> {
  int _selectedDrawerIndex = 0;

  String currentProfilePic =
      "https://avatars3.githubusercontent.com/u/16825392?s=460&v=4";

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return ; //Home
      case 1:
        return ProfileScreen(); //Profile
      case 2:
        return  JobScreen();  // Jobs
      case 3:
        return ;  // Grievance Platform
      case 4:
        return EventScreen(); // Events
      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(d.icon,color:Colors.black),
        title: new Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }
    return WillPopScope(
      onWillPop: () {
        if (_selectedDrawerIndex != 0) {
          setState(() {
            _selectedDrawerIndex = 0;
          });
          _getDrawerItemWidget(_selectedDrawerIndex);
        } else {
          Navigator.pop(context, true);
        }
        return new Future(() => false);
      },
      child: Scaffold(
        appBar: new AppBar(
          title: new Text(widget.drawerItems[_selectedDrawerIndex].title,style:GoogleFonts.getFont('Lato')),
          backgroundColor: kPrimaryColor,
          actions: const [Icon(Icons.more_vert)],
        ),
        drawer: new Drawer(
          backgroundColor: kPrimaryLightColor,
          child: new Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountEmail: Text("jessica.schmitz@gmail.com"),
                accountName: Text("Jessica schmitz"),
                currentAccountPicture: new GestureDetector(
                  child: new CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                  onTap: () => Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return ProfileScreen();
                    },
                  ),
                  ),
                ),
              ),
              Column(children: drawerOptions)
            ],
          ),
        ),
        body: _getDrawerItemWidget(_selectedDrawerIndex),
      ),
    );
  }
}


