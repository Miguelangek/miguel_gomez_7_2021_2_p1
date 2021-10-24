import 'package:flutter/material.dart';
import 'package:memeapp/models/Data.dart';

class photosScreen extends StatefulWidget {
 
 

  @override
  _photosScreenState createState() => _photosScreenState();
}

class _photosScreenState extends State<photosScreen> {
 List<Data>  _photos = [];

void initState(){
  super.initState();
  _getphotos();
}




  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }

  void _getphotos() async {
    

  }
}