import 'package:flutter/material.dart';
import '../../../../constants/constants.dart';
class EventDescription extends StatelessWidget{
  // const EventDescription({super.key});

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Vapasi: Bringing women back to work',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(
                  'ThoughtWorks - Gurgaon, India',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.location_on, 'LOCATION'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Vapasi, a #TalkTechToHer initiative from Thoughtworks helps experienced women technologists who are currently on a career break, resume their tech journeys. The last 20 batches of Vapasi tailored for Developers and Quality Analysts saw more than 250+ women participate in the returnee program.',
        softWrap: true,
        textAlign: TextAlign.justify,
   style:TextStyle(fontFamily:'Roboto',),
      ),
    );

    return  Scaffold(
        appBar: AppBar(
          title: const Text('Event Description'),
          backgroundColor: kPrimaryLightColor,
        ),
        body: ListView(
          children: [
            Image.asset(
              'assets/images/event.jpg',
              // width: 600,
              // height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: color,
              fontFamily:'Roboto-Regular',
            ),
          ),
        ),
      ],
    );
  }

}