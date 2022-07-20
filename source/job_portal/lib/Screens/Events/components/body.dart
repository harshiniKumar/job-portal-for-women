import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_portal/Screens/Home/home_screen.dart';
import '../../../../constants/constants.dart';
import 'package:job_portal/Screens/Events/event_data.dart';
import 'event_description.dart';
class Body extends StatelessWidget {
  var eventData = EventData.eventData;

  Body({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: size.height * 0.01),
          Expanded(
              child:ListView.builder(
                  itemCount:eventData.length,
                  itemBuilder:(context,index) {
                    return Card(
                      color:kPrimaryLightColor,
                      elevation: 7,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(height: size.height * 0.02),
                          ListTile(
                            leading: getIcon(eventData[index]),
                            title: getName(eventData[index]),
                            subtitle: getDescription(eventData[index]),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              TextButton(
                                child: const Text('MORE DETAILS'),
                                onPressed:  () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => EventDescription()));
                                  /* ... */},
                              ),
                              const SizedBox(width: 8),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
              )
          )
        ]
    );
  }
  getName(data)
  {
    return Text('${data['name']}',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18));
  }

  getDescription(data) {
    return Text('${data['description']}',);
  }

  getIcon(data) {
    return SvgPicture.asset('${data['icon']}');
  }




}