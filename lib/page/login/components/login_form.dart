import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_boxes/components/custom_auth_text_form_field.dart';
import 'package:the_boxes/components/custom_elavated_button.dart';
import 'package:the_boxes/_core/util/validation_utils.dart';
import 'package:the_boxes/_core/constants/size.dart';
import 'package:the_boxes/data/dto/join_req_dto.dart';
import 'package:the_boxes/data/dto/res_dto.dart';
import 'package:the_boxes/data/store/session_store.dart';

class LoginForm extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();

  LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            funPageRoute: () async {
              if (_formKey.currentState!.validate()) {
                // 이메일과 비밀번호 가져오기
                String username = _username.text;
                String password = _password.text;

                // 로그인 요청 DTO 생성
                LoginReqDTO loginReqDTO = LoginReqDTO(username: username, password: password);

                // 로그인 메서드 호출
                final sessionStore = ref.read(sessionProvider);
                await sessionStore.login(loginReqDTO);

                if (sessionStore.isLogin) {
                  print('login form 로그인 성공');
                  // 로그인 성공 시 Home 페이지로 이동
                  Navigator.of(context).pushReplacementNamed('/home'); // Navigate to HomePage
                } else {
                  // 로그인 실패 시 에러 메시지 표시
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('로그인 실패. 다시 시도해 주세요.')),
                  );
                }
              }
            },
          ),

        ],
      ),
    );
  }
}
