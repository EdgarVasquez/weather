import 'package:flutter/material.dart';
import 'package:weather/networking.dart';
import 'package:weather/Locator.dart';
import 'package:weather/location.dart';

class weather{
  Future<dynamic> obtenDatos() async {
    double? latitud;
    double? longitud;
    Locator locate = Locator();
    await locate.GetLocation();
    latitud= locate.latitud;
    longitud= locate.Longitud;
    network net = network(url: "https://api.openweathermap.org/data/2.5/weather?lat=$latitud&lon=$longitud&appid=2380f148a5c0c1f84f96a27243a722cb");
    await net.ObtenerInformacion();
    return net;
  }
  Future<dynamic> obtenerDatosPorCiudad(String nombreCiudad) async {
    final apiKey = "2380f148a5c0c1f84f96a27243a722cb";
    final url =
        "https://api.openweathermap.org/data/2.5/weather?q=$nombreCiudad&appid=$apiKey";

    network net = network(url: url);
    await net.ObtenerInformacion();
    return net;
  }

}