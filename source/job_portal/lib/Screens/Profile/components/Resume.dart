import 'package:flutter/material.dart';

import 'Gallery/gallery_fetch.dart';
class Resume extends StatefulWidget{
  @override
  _ResumeState createState() => _ResumeState();

  }
class _ResumeState extends State<Resume> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:GalleryFetch()
    );
  }

}
