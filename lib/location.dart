import 'package:flutter/material.dart';
import 'package:weather/constants.dart';
import 'package:weather/city.dart';
import 'package:weather/weather.dart';
import 'package:weather/networking.dart';

class location{
  final double Temperatura;
  final String Ciudad;
  final String emoji;
  final String emojiRecomendacion;
  location( this.Temperatura, this.Ciudad, this.emoji, this.emojiRecomendacion);
}
class LocationScreen extends StatefulWidget{
  LocationScreen({super.key});
  static const routeName = '/location';

  @override
  _LocationScreenState createState() => _LocationScreenState();
}
class _LocationScreenState extends State<LocationScreen>{
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext buildContext){
    final location args = ModalRoute.of(context)!.settings.arguments as location;
          return Scaffold(
              backgroundColor: Colors.lightBlue,
            body: Container(

              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/location_background.jpg'),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.dstATop),
                ),
              ),
              constraints: BoxConstraints.expand(),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          TextButton(
                            onPressed: () async {
                            weather weath = weather();
                            network net = await weath.obtenDatos();
                              Navigator.pushNamed(
                            context,
                             LocationScreen.routeName, arguments: location(net.Temperatura,net.Ciudad,net.emoji,net.emojiRecomendacion),

    );
                              },
                            child: Icon(
                              Icons.near_me,
                              size: 50.0,
                              color: Colors.white,
                            ),

                          ),
                          TextButton(
                            onPressed: (){
                              Navigator.pushNamed(
                                context,
                                CityScreen.routeName,

                              );
                            },
                            child: Icon(
                              Icons.location_city,
                              size: 50.0,
                              color: Colors.white,
                            ),

                          )
                        ]
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            args.Temperatura.toStringAsFixed(1),
                            style: KTempTextStyle,
                          ),
                          Text(
                            args.emoji,
                            style: KConditionTextStyle,
                          )
                        ],
                      ),


                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Its"+args.emojiRecomendacion+ "time",
                            style: KMessageTextStyle,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            args.Ciudad.toString(),
                            style: KMessageTextStyle,
                            textAlign: TextAlign.right,
                          ),

                        ],
                      ),

                    )
                  ],
                ),
              ),
            )
          );


  }

}