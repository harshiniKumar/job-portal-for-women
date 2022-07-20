import 'package:flutter/material.dart';
class JobScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Card(
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/1.png'))),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Nouveautés'),
              ),
            ),
            margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
          )
        ],
      ),
    );
  }
}