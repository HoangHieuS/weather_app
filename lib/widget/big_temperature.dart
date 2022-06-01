import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';

class BigTemperature extends StatelessWidget {
  final String text;
  const BigTemperature({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Constants constants = Constants();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 80,
              foreground: Paint()..shader = constants.shader,
            ),
          ),
        ),
        Text(
          'o',
          style: TextStyle(
            fontSize: 40,
            foreground: Paint()..shader = constants.shader,
          ),
        ),
      ],
    );
  }
}
