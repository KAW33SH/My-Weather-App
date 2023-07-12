import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import '../helpers/pressure_widget.dart';

class PressurePage extends StatelessWidget {
  final String? location;
  final int? pressure;

  const PressurePage({super.key, this.location, this.pressure});

  // Icon
  final Icon pressureIcon = const Icon(
    WeatherIcons.barometer,
    color: Colors.blue,
    size: 64.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Pressure Information"),
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
              pressureWidget(pressureIcon, '$pressure', '$location'),
            ],
          ),
        ),
      ),
    );
  }
}
