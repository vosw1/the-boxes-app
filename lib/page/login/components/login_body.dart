import 'package:flutter/material.dart';
import 'package:the_boxes/page/login/components/login_form.dart';
import 'package:the_boxes/page/login/components/logo.dart';
import 'package:the_boxes/page/login/components/sign_up_button.dart';
import 'package:the_boxes/_core/constants/size.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          SizedBox(height: l_gap),
          Logo("The Box"),
          SizedBox(height: m_gap),
          LoginForm(), // 로그인 폼
          SignUpButton()
        ],
      ),
    );
  }
}