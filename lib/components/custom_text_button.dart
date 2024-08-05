import 'package:flutter/material.dart';
import 'package:the_boxes/_core/constants/size.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback function;
  final TextStyle? textStyle; // Optional parameter for text style
  final Color? buttonColor; // Optional parameter for button color
  final EdgeInsetsGeometry? padding; // Optional parameter for padding

  const CustomTextButton({
    Key? key,
    required this.text,
    required this.function,
    this.textStyle, // Optional parameter
    this.buttonColor, // Optional parameter
    this.padding, // Optional parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      style: TextButton.styleFrom(
        foregroundColor: buttonColor ?? Colors.black87, padding: padding ?? EdgeInsets.symmetric(vertical: s_gap), // Default padding
      ),
      child: Text(
        text,
        style: textStyle ?? const TextStyle(
          color: Colors.black87,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
