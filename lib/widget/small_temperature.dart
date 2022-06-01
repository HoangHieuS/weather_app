import 'package:flutter/material.dart';

class SmallTemperature extends StatelessWidget {
  final double textSize;
  final double subTextSize;
  final String text;
  final Color color;
  const SmallTemperature({
    Key? key,
    required this.textSize,
    required this.text,
    required this.subTextSize, required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: textSize,
          color: color,
          fontWeight: FontWeight.w600,
        ),
        children: [
          TextSpan(
            text: text,
          ),
          WidgetSpan(
            child: Transform.translate(
              offset: textSize == subTextSize
                  ? const Offset(0.0, -7.0)
                  : const Offset(0.0, -15.0),
              child: Text(
                'o',
                style: TextStyle(
                  fontSize: subTextSize,
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
