// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_portal/constants/constants.dart';
import 'package:job_portal/constants/profile_constants.dart';
import 'package:avatar_view/avatar_view.dart';
import '../../../components/rounded_button.dart';

Widget profileHeaderWidget(BuildContext context) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(color: Colors.white),
    child: Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 18.0,top:18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
              AvatarView(
                radius: 65,
                borderColor: Colors.grey,
                avatarType: AvatarType.RECTANGLE,
                imagePath:'assets/images/profile.jpg',
                placeHolder: Icon(Icons.person, size: 50,),
                errorWidget: Icon(Icons.error, size: 50,),
              ),
              Flexible(
                child:
                  Column(
                    children:  [
                      ListTile(
                        dense:true,
                          leading:Icon(Icons.account_box),
                          title: Text(
                            userName.toUpperCase(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ListTile(
                        leading:Icon(Icons.work),
                        dense:true,
                        title: Text(
                          profession,
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ),
                      ListTile(
                        dense:true,
                        leading: Icon(Icons.phone_android),
                        title: Text(
                          phoneNo,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                      ListTile(
                        dense:true,
                        leading: Icon(Icons.location_on),
                        title: Text(
                         location,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
              ),
          ),
        ]),
  ])));
}

