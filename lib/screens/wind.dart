import 'package:flutter/material.dart';

import '../helpers/wind_info_widget.dart';
import '../helpers/wind_widget.dart';

class WindPage extends StatelessWidget {
  final String? location;
  final double? windSpeed;
  final int? windDeg;
  final double? windGust;

  const WindPage(
      {super.key, this.windSpeed, this.windDeg, this.windGust, this.location});
  final Icon windIcon = const Icon(
    Icons.air,
    color: Colors.blue,
    size: 64.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Wind Information"),
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
          padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
          child: Column(
            children: [
              Container(
                child: windWidget(windIcon, '$windDeg', '$windGust',
                    '$windSpeed', '$location'),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                "Additional Wind Information",
                style: TextStyle(
                    fontSize: 24,
                    color: Color(0xdd212121),
                    fontWeight: FontWeight.bold),
              ),
              Container(
                width: 300,
                child: const Divider(
                  color: Color.fromARGB(255, 41, 97, 251),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              windInfoWidget('$windDeg', '$windGust'),
            ],
          ),
        ),
      ),
    );
  }
}
