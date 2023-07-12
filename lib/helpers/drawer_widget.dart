import 'package:flutter/material.dart';

import '../model/weather_model.dart';
import '../screens/feels_like.dart';
import '../screens/humidity.dart';
import '../screens/pressure.dart';
import '../screens/wind.dart';
import 'package:weather_icons/weather_icons.dart';

class DrawerWidget extends StatefulWidget {
  final String selectedCity;
  final Weather? data;
  const DrawerWidget({
    Key? key,
    required this.selectedCity,
    this.data,
  }) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  Weather? data;

  @override
  void initState() {
    super.initState();
  }

  get location => widget.selectedCity;
  get windSpeed => widget.data!.windSpeed;
  get windDeg => widget.data!.windDeg;
  get windGust => widget.data!.windGust;
  get humidity => widget.data!.humidity;
  get feelsLike => widget.data!.feelsLike;
  get pressure => widget.data!.pressure;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              // transparent background
              color: Colors.transparent,
              // no divider line
              border: Border(
                bottom: BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      WeatherIcons.horizon_alt,
                      size: 100,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: const Row(
                    children: [
                      Icon(WeatherIcons.humidity, size: 20),
                      SizedBox(
                        width: 20.0,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text('Humidity'),
                      ),
                    ],
                  ),
                  onTap: () async {
                    // create a scaffold and pass data to it
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HumidityPage(
                          location: location,
                          humidity: humidity,
                        ),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Row(
                    children: [
                      Icon(WeatherIcons.cloudy_windy, size: 20),
                      SizedBox(
                        width: 20.0,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text('Wind'),
                      ),
                    ],
                  ),
                  onTap: () async {
                    // create a scaffold and pass data to it
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WindPage(
                          location: location,
                          windSpeed: windSpeed,
                          windDeg: windDeg,
                          windGust: windGust,
                        ),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Row(
                    children: [
                      Icon(WeatherIcons.thermometer, size: 20),
                      SizedBox(
                        width: 20.0,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text('Feels Like'),
                      ),
                    ],
                  ),
                  onTap: () async {
                    // create a scaffold and pass data to it
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FeelsLikePage(
                          location: location,
                          feelsLike: feelsLike,
                        ),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Row(
                    children: [
                      Icon(
                        WeatherIcons.barometer,
                        size: 20,
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text('Pressure'),
                      ),
                    ],
                  ),
                  onTap: () async {
                    // create a scaffold and pass data to it
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PressurePage(
                          location: location,
                          pressure: pressure,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
