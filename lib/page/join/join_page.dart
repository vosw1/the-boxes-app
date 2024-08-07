import 'package:flutter/material.dart';
import 'package:the_boxes/page/home/components/custom_app_bar.dart';

import 'components/join_body.dart';

class JoinPage extends StatelessWidget {
  const JoinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '회원가입'), // Use your custom AppBar
      resizeToAvoidBottomInset: true, // 키보드 올라와도 안깨지게 설정
      body: JoinBody(),
    );
  }
}