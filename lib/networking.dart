import 'dart:convert';
import 'package:weather/Locator.dart';
import 'package:http/http.dart' as http;

class network{
  network({required this.url});
  final String url;
  var Temperatura;
  var Ciudad;
  var emoji;
  var emojiRecomendacion;

  Future ObtenerInformacion() async {

    final response = await http.get(Uri.parse(url));
print(response.statusCode);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final cityName = data['name'];
      final country = data['sys']['country'];

      // Obtener probabilidad de lluvia
      final rainProbability = data['rain'] != null
          ? data['rain']['1h']
          : data['pop'];
      final temperaturaKelvin = data['main']['temp'];
      final temperaturaCelsius = temperaturaKelvin - 273.15;

      Temperatura = temperaturaCelsius;
      Ciudad = cityName.toString();
      emoji = obtenerEmojiTemperatura(temperaturaCelsius);
      emojiRecomendacion = obtenerEmojiRecomendacion(temperaturaCelsius);

    }  else {
      throw Exception('Error al obtener los datos de la red');
    }
  }

}
String obtenerEmojiRecomendacion(double temperatura) {
  if (temperatura >= 35) {
    return '🌞'; // Emoji para recomendación de calor extremo
  } else if (temperatura >= 30) {
    return '🏖️'; // Emoji para recomendación de playa o actividades al aire libre
  } else if (temperatura >= 25) {
    return '🍦'; // Emoji para recomendación de tomar helado
  } else {
    return '☕'; // Emoji para recomendación de tomar una bebida caliente
  }
}

String obtenerEmojiTemperatura(double temperatura) {
  if (temperatura >= 35) {
    return '🔥'; // Emoji para temperatura muy calurosa
  } else if (temperatura >= 30) {
    return '☀️'; // Emoji para temperatura calurosa
  } else if (temperatura >= 25) {
    return '😎'; // Emoji para temperatura moderada
  } else {
    return '❄️'; // Emoji para temperatura fresca
  }
}