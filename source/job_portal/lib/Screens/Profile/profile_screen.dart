import 'package:flutter/material.dart';
import 'package:job_portal/Screens/Profile/components/About.dart';
import 'package:job_portal/Screens/Profile/components/Gallery/gallery_upload.dart';
import 'package:job_portal/Screens/Profile/components/Resume.dart';
import 'package:job_portal/Screens/Profile/components/body.dart';
import 'package:job_portal/Screens/Profile/components/Gallery/gallery.dart';
import '../../../constants/constants.dart';

import 'components/profile_header_widget.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
              ),
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              "My Profile",
              style:
              TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
            ),
            centerTitle: false,
            elevation: 0,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.add_box_outlined,
                  color: Colors.black,
                ),
                onPressed: () => Navigator.push(context,MaterialPageRoute(builder:  (context) {
                  return GalleryUpload();
                }))
              ),
              IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                onPressed: () => print("Add"),
              )
            ],
          ),
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    profileHeaderWidget(context),
                  ],
                ),
              ),
            ];
          },
          body: Column(
            children: <Widget>[
              const Material(
                color: Colors.white,
                child: TabBar(
                  labelColor: kPrimaryColor,
                  unselectedLabelColor: Colors.black,
                  indicatorWeight: 2,
                  indicator:BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      color: kPrimaryLightColor),
                  indicatorColor: kPrimaryColor,
                  tabs: [
                    Tab(text:'About'),
                    Tab(text:'Gallery'),
                    Tab(text:'Resume'),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    About(),
                    Gallery(),
                    Resume(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
