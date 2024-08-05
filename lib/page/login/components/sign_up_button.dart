import 'package:flutter/material.dart';
import 'package:the_boxes/_core/constants/size.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, "/join");
      },
      child: Text(
        "아직 회원이 아니신가요?",
        style: TextStyle(
          fontSize: m_gap,
        ),
      ),
    );
  }
}
