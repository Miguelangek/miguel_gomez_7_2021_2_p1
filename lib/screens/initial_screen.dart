import 'dart:convert';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:memeapp/components/loader_component.dart';
import 'package:memeapp/screens/home_screen.dart';
import 'package:http/http.dart' as http;

class initialScreen extends StatefulWidget {
  const initialScreen({ Key? key }) : super(key: key);

  @override
  _initialScreenState createState() => _initialScreenState();
}

class _initialScreenState extends State<initialScreen> {

bool _showloader = false;
String _meme = '';


  @override
  Widget build(BuildContext context) {
return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 40,),
                _showlogo(),
                SizedBox(height: 20,),
                _showButtons(),
              ],
            ),
          ),
          _showloader ? LoaderComponent(text: 'Por favor espere...') : Container(),
        ],
      ),
    );
  }

  Widget _showlogo() {
    return Image(
      image: AssetImage('assets/img_main.PNG'),
       );
  }

  Widget _showButtons() {
     return Container(
       margin: EdgeInsets.only(left: 10, right: 10),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                   child: Text('Vamos a ver que hay'),
                   style: ButtonStyle(
                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states){
                            return Colors.orange;
                          }
                     ),
                    ),
                    onPressed: () => _ingresar(),
                            ),
                ),
           ],

       ),
     );

  }

  void _ingresar() async {
     var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        _showloader = false;
      });
      await showAlertDialog(
        context: context,
        title: 'Error', 
        message: 'Verifica que estes conectado a internet.',
        actions: <AlertDialogAction>[
            AlertDialogAction(key: null, label: 'Aceptar'),
        ]
      );    
      return;
  }
   
   

   Navigator.pushReplacement(
     context, 
     MaterialPageRoute(
       builder: (context) => photoscreen()
       )
     );

     
    


     
  }
}