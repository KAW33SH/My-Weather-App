import 'package:flutter/material.dart';

class LocationNameWidget extends StatelessWidget {
  final String location;
  const LocationNameWidget({
    super.key,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      // cityName from Weather
      location,
      style: TextStyle(
        fontSize: 18.0,
        color: Colors.grey[700],
      ),
    );
  }
}
