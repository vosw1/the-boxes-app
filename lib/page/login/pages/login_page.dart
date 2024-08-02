import 'package:flutter/material.dart';
import 'package:the_boxes/page/login/components/custom_form.dart';
import 'package:the_boxes/page/login/components/logo.dart';
import 'package:the_boxes/size.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(height: l_gap),
            Logo("The Box"),
            SizedBox(height: m_gap),
            CustomForm(), // 로그인 폼
          ],
        ),
      ),
    );
  }
}
