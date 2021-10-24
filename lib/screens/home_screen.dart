import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:memeapp/models/Data.dart';
import 'package:http/http.dart' as http;
import 'package:memeapp/models/photomemes.dart';


class homeScreen extends StatefulWidget {


  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Memes'),
        
        ),
      body: _getbody(),
    );
  }

  Widget _getbody() {
    return Center(
      child: Text(''),
      );
  }

}

class photoscreen extends StatefulWidget {
  
  @override
  _photoscreenState createState() => _photoscreenState();
}

class _photoscreenState extends State<photoscreen> {
  List<Data> _photos = [];

@override
  void initState() {
    super.initState();
    _getphotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('memes recopilados'),
        ),
      body: Center(
          child: Text('hola'),
        //_getcontent(),
      ),
    
    );
  }

  void _getphotos() async{
     var url = Uri.parse('https://api.doge-meme.lol/v1/memes/?skip=0&limit=100');
     var response = await http.get(
       url,
       headers: {
         'content-type': 'application/json',
           'accept': 'application/json',

       },
       
       );
       print(response.body);
         
       
        

        //var image = decodeData['data'][i]['submission_url'];
          //if (image.contains('jpg') ||
            //  image.contains('png') ||
              //image.contains('gif')) {}

         
      var body = response.body;
      var decodedJson = jsonDecode(body);
      if(decodedJson != null){
          for (var item in decodedJson) {
            if(item.length == 12){
                _photos.add(Data.fromJson(item));
            }
            
          }

      }
  
  }
  


     
  }
 
 //Widget _getcontent() {
 
//}

