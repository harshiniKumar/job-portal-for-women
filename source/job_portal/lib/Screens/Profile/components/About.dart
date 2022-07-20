import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_portal/Screens/Profile/components/Gallery/gallery_upload.dart';
import '../../../../constants/constants.dart';
class About extends StatelessWidget {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        ExpansionTile(
        backgroundColor: kPrimaryLightColor,
        textColor: Colors.black,
        collapsedTextColor: kPrimaryColor,
          leading:new Icon(CupertinoIcons.book_circle_fill,color:kPrimaryColor),
          title: Text('Education'),
          subtitle: Text('Graduated at ABC University'),
          children: const <Widget>[
            ListTile(title: Text('School'),subtitle: Text('CMS Matriculation School')),
            ListTile(title: Text('College'),subtitle: Text('ABC University')),
          ],
        ),
        ExpansionTile(
          backgroundColor: kPrimaryLightColor,
          textColor: Colors.black,
          collapsedTextColor: kPrimaryColor,
          leading:Icon(CupertinoIcons.bag_fill,color:kPrimaryColor),
          title: Text('Experience'),
          subtitle: Text('Working at Infosys'),
          children: <Widget>[
            ListTile(title: Text('Graphic Designer')),
          ],
        ),
        ExpansionTile(
          backgroundColor: kPrimaryLightColor,
          textColor: Colors.black,
          collapsedTextColor: kPrimaryColor,
          leading:new Icon(CupertinoIcons.rectangle_dock,color:kPrimaryColor),
          title: Text('Certifications'),
          subtitle: Text('Adobe Illustration Certificate'),
          children: <Widget>[
            ListTile(title: Text('This is tile number 1')),
          ],
        ),
      ],
    );
  }

}