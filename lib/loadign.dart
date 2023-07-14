import 'package:flutter/material.dart';
import 'package:weather/networking.dart';
import 'package:weather/Locator.dart';
import 'package:weather/location.dart';
import 'package:weather/weather.dart';

class Loading extends StatefulWidget {
  static const routeName = '/loading';
  @override
  LoadingState createState() => LoadingState();
}

class LoadingState extends State<Loading> {
  @override
  void initState() {
    obtenDatos();
    super.initState();

  }
  double? latitud;
  double? longitud;
  void obtenDatos() async {
    weather weath = weather();
   network net = await weath.obtenDatos();
    Navigator.pushNamed(
      context,
      LocationScreen.routeName,
      arguments: location(net.Temperatura,net.Ciudad,net.emoji,net.emojiRecomendacion),

    );
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body:Center(
            child: ElevatedButton(
              onPressed: () async {
                obtenDatos();
              },
              child: Text('Get Location'),
            )
          ),

    );
  }
}
