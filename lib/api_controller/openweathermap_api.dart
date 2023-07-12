import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_weather_api/api_controller/secret_key.dart';
import '../model/weather_model.dart';

String myApiKey = ApiKey.secretKey;
String url = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherApiClient {
  Future<Weather>? getCurrentWeather(String? location) async {
    var endpoint = Uri.parse('$url?q=$location&appid=$myApiKey&units=metric');

    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    if (response.statusCode == 404) {
      return Weather(
          cityName: "Not found",
          temp: 0.0,
          weatherLike: 'Not found',
          weatherDesc: 'Not found',
          weatherIcon: '01d',
          windSpeed: 0.0,
          windDeg: 0,
          windGust: 0.0,
          humidity: 0,
          feelsLike: 0.0,
          pressure: 0);
    } else {
      debugPrint(Weather.fromJson(body).cityName);
      return Weather.fromJson(body);
    }
  }
}
