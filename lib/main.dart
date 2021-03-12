import 'package:flutter/material.dart';
import 'package:youtube/screen/screen_home.dart';

void main()=>runApp (MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fluttertube",
      home: Home(),
    );
  }
}


