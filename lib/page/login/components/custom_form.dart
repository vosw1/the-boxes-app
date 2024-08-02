import 'package:flutter/material.dart';
import 'package:the_boxes/components/CustomTextFormField.dart';
import 'package:the_boxes/page/login/components/login_button.dart';
import 'package:the_boxes/size.dart';

import 'join_button.dart';

class CustomForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField("ID"),
          SizedBox(height: m_gap),
          CustomTextFormField("Password"),
          SizedBox(height: ml_gap),
          LoginButton(formKey: _formKey), // LoginButton 사용
          SizedBox(height: ss_gap),
          SignUpButton(), // SignUpButton 사용
        ],
      ),
    );
  }
}
