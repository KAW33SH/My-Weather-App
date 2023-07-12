import 'package:flutter/material.dart';

import '../model/weather_model.dart';

Widget windWidget(Icon windIcon, String windDegree, String windGust,
    String windSpeed, String location) {
  Weather? weather;
  weather?.cityName = location;

  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        windIcon,
        Text(
          "$windSpeed m/s",
          style: const TextStyle(
            fontSize: 46.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          // cityName from Weather
          location,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.grey[600],
          ),
        ),
      ],
    ),
  );
}

// get value from dropdownButton and set lat and lon

