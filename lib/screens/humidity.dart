import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import '../helpers/humidity_widget.dart';

class HumidityPage extends StatelessWidget {
  final String? location;
  final int? humidity;

  const HumidityPage({super.key, this.location, this.humidity});
  final Icon humidityIcon = const Icon(
    WeatherIcons.humidity,
    color: Colors.blue,
    size: 64.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Humidity Information"),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue.shade100, Colors.orange.shade50],
              begin: Alignment.centerLeft,
              end: Alignment.bottomLeft,
              stops: const [0.3, 0.7]),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
          child: Column(
            children: [
              humidityWidget(humidityIcon, '$humidity', '$location'),
            ],
          ),
        ),
      ),
    );
  }
}
