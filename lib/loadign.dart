import 'package:flutter/material.dart';
import 'package:weather/networking.dart';
import 'package:weather/Locator.dart';
import 'package:weather/location.dart';

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
    Locator locate = Locator();
    await locate.GetLocation();
    latitud= locate.latitud;
    longitud= locate.Longitud;
    print(latitud);
    print(longitud);

    network net = network(url: "https://api.openweathermap.org/data/2.5/weather?lat=$latitud&lon=$longitud&appid=2380f148a5c0c1f84f96a27243a722cb");

    await net.ObtenerInformacion();
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
