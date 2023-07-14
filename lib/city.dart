import 'package:flutter/material.dart';
import 'package:weather/networking.dart';
import 'package:weather/Locator.dart';
import 'package:weather/location.dart';
import 'package:weather/weather.dart';
import 'package:weather/constants.dart';

class CityScreen extends StatefulWidget {
  static const routeName = '/city';
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  final myController = TextEditingController();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () async {

                    weather weath = weather();
                    network net = await weath.obtenDatos();
                    Navigator.pushNamed(
                      context,
                      LocationScreen.routeName, arguments: location(net.Temperatura,net.Ciudad,net.emoji,net.emojiRecomendacion),

                    );
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  controller: myController,
                  onChanged: (value){
                  //  cityName = value;
                  },
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    icon: Icon(Icons.location_city,color: Colors.white,
                    ),
                    hintText: 'Enter City Name',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide.none,
                    )
                  ),
                ),
              ),
              TextButton(
                onPressed: () async {
                  weather weath = weather();
                  network net = await weath.obtenerDatosPorCiudad(myController.text);
                  Navigator.pushNamed(
                    context,
                    LocationScreen.routeName,
                    arguments: location(net.Temperatura,net.Ciudad,net.emoji,net.emojiRecomendacion),

                  );
                },
                child: Text(
                  'Get Weather',
                  style: KButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
