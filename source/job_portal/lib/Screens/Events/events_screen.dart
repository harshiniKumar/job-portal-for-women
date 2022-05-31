import 'package:flutter/material.dart';
import '../Events/components/body.dart';

class EventScreen extends StatelessWidget {

  static const String _title = 'Shero Search';

  const EventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: Body(),
      ),
    );
  }
}




