import 'package:flutter/material.dart';
import 'package:the_boxes/components/custom_auth_text_form_field.dart';
import 'package:the_boxes/components/custom_elavated_button.dart';
import 'package:the_boxes/_core/util/validation_utils.dart';
import 'package:the_boxes/_core/constants/size.dart';

class LoginForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAuthTextFormField(
            text: "ID",
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: m_gap,
            ),
            obscureText: false,
            funValidator: ValidationUtils.validateUsername,
            controller: _username,
          ),
          const SizedBox(height: s_gap),
          CustomAuthTextFormField(
            text: "Password",
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: m_gap,
            ),
            obscureText: true,
            funValidator: ValidationUtils.validatePassword,
            controller: _password,
          ),
          const SizedBox(height: sl_gap),
          CustomElevatedButton(
            text: "로그인",
            funPageRoute: () {
              bool isOk = _formKey.currentState!.validate();

              if (isOk) {
                String username = _username.text.trim();
                String password = _password.text.trim();

                // 로그인 성공 후 home 페이지로 이동
                Navigator.pushReplacementNamed(context, '/home');
              }
            },
          ),
        ],
      ),
    );
  }
}
