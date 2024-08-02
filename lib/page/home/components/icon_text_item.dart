import 'package:flutter/material.dart';

class IconTextItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconTextItem({
    required this.icon,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 40.0, // Customize icon size
          color: Colors.blue, // Customize icon color
        ),
        SizedBox(height: 8.0), // Space between icon and text
        Text(
          text,
          style: TextStyle(fontSize: 16.0), // Customize text size
        ),
      ],
    );
  }
}
