import 'package:flutter/material.dart';
import 'package:the_boxes/_core/constants/size.dart';
import 'package:the_boxes/components/custom_auth_text_form_field.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final bool obscureText;

  CustomTextField({
    required this.label,
    required this.controller,
    this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAuthTextFormField(
          text: label,
          obscureText: obscureText,
          funValidator: validator,
          controller: controller,
        ),
        SizedBox(height: m_gap),
      ],
    );
  }
}
