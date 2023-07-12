import 'package:flutter/material.dart';

TextStyle titleFont =
    const TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0);
TextStyle infoFont =
    const TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0);
Widget homeInfoWidget(
    String wind, String humidity, String pressure, String feelsLike) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(18.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'wind',
                  style: titleFont,
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Text(
                  'Pressure',
                  style: titleFont,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$wind m/s',
                  style: infoFont,
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Text(
                  '$pressure hPa',
                  style: infoFont,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Humidity',
                  style: titleFont,
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Text(
                  'Feels Like',
                  style: titleFont,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$humidity %',
                  style: infoFont,
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Text(
                  '$feelsLike °C',
                  style: infoFont,
                ),
              ],
            ),
          ],
        )
      ],
    ),
  );
}
