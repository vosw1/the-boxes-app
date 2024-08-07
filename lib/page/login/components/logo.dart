import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_boxes/_core/constants/size.dart';

class Logo extends StatelessWidget {
  final String title;

  const Logo(this.title);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/logo_item.png",
          height: xl_gap,
          width: xl_gap,
        ),
        SizedBox(height: ss_gap),
        Text(
          title,
          style: TextStyle(fontSize: sl_gap, fontWeight: FontWeight.bold, color: CupertinoColors.systemBlue),
        ),
      ],
    );
  }
}
