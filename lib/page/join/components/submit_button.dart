import 'package:flutter/material.dart';
import 'package:the_boxes/components/custom_elavated_button.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback onPressed;

  SubmitButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      text: "회원가입",
      funPageRoute: onPressed,
    );
  }
}
