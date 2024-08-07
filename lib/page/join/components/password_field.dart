import 'package:flutter/material.dart';
import 'package:the_boxes/components/custom_auth_text_form_field.dart';
import 'package:the_boxes/_core/util/validation_utils.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController controller;

  PasswordField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomAuthTextFormField(
      text: "Password",
      obscureText: true,
      funValidator: ValidationUtils.validatePassword,
      controller: controller,
    );
  }
}
