import 'package:flutter/material.dart';
import 'package:weather/location.dart';
import 'package:weather/loadign.dart';
import 'package:weather/city.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/loading',
      routes: {
        '/loading': (context) => Loading(),
        LocationScreen.routeName: (context) => LocationScreen(),
      },
      title: 'Wheather',
      home: Scaffold(
        appBar: AppBar(

          title:Center(
            child:
           Text(
              'Wheather')
          ),

          backgroundColor: Colors.lightBlue,
        ),
      //  body:Loading()
      ),
    );
  }
}
