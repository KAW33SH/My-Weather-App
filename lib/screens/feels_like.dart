import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import '../helpers/feels_like_widget.dart';

class FeelsLikePage extends StatelessWidget {
  final String? location;
  final double? feelsLike;

  const FeelsLikePage({super.key, this.location, this.feelsLike});

  // Icon
  final Icon feelsLikeIcon = const Icon(
    WeatherIcons.thermometer,
    color: Colors.blue,
    size: 64.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Feels Like"),
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
              feelsLikeWidget(feelsLikeIcon, '$feelsLike', '$location'),
            ],
          ),
        ),
      ),
    );
  }
}
