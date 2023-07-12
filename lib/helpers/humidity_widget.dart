import 'package:flutter/material.dart';

import '../model/weather_model.dart';
import 'location_name_widget.dart';

Widget humidityWidget(Icon humidityIcon, String humidity, String location) {
  Weather? weather;
  weather?.cityName = location;

  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        humidityIcon,
        const SizedBox(
          height: 20.0,
        ),
        Text(
          "$humidity %",
          style: const TextStyle(
            fontSize: 46.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        LocationNameWidget(location: location),
      ],
    ),
  );
}
