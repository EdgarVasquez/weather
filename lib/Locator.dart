import 'package:flutter/material.dart';
import 'package:weather/constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:weather/networking.dart';
class Locator{
   double? latitud;
   double? Longitud;

   Future  GetLocation() async {

     Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
     Longitud = position.longitude;
     latitud = position.latitude;

   }
}
