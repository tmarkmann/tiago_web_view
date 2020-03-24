import 'package:flutter/material.dart';
import 'package:tiago_web_view/screens/init_ros_screen.dart';

class TiagoWebApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiago Web View',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InitRosScreen(),
    );
  }
}