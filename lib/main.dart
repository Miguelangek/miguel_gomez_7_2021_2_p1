import 'package:flutter/material.dart';
import 'package:memeapp/screens/initial_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      title: 'memes app',
      home: initialScreen(),
    );
  }
}