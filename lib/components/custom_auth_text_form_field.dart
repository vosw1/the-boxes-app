import 'package:flutter/material.dart';
import 'package:the_boxes/_core/constants/size.dart'; // Ensure size.dart defines s_gap and m_gap

class CustomAuthTextFormField extends StatelessWidget {
  final String text;
  final bool obscureText;
  final FormFieldValidator<String>? funValidator;
  final TextEditingController controller;
  final TextStyle? labelStyle; // Optional parameter for label text style

  const CustomAuthTextFormField({
    Key? key,
    required this.text,
    this.obscureText = false,
    this.funValidator,
    required this.controller,
    this.labelStyle, // Optional text style parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: s_gap), // Move text to the right by s_gap
          child: Text(
            text,
            style: labelStyle ?? TextStyle(
              fontSize: m_gap, // Adjust font size according to your needs
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: s_gap),
        TextFormField(
          controller: controller,
          validator: funValidator,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: "Enter $text",
            hintStyle: TextStyle(
              fontSize: m_gap, // Adjust font size according to your needs
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(m_gap),
              borderSide: BorderSide(color: Colors.grey), // Optional border color
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(m_gap),
              borderSide: BorderSide(color: Colors.blueAccent), // Optional border color
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(m_gap),
              borderSide: BorderSide(color: Colors.red), // Optional border color
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(m_gap),
              borderSide: BorderSide(color: Colors.red), // Optional border color
            ),
          ),
        ),
      ],
    );
  }
}
