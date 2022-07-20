import 'package:flutter/material.dart';
import '../Events/components/body.dart';

class EventScreen extends StatelessWidget {

  static const String _title = 'Shero Search';

  const EventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Body(),
      ),
    );
  }
}




