import 'package:flutter/material.dart';

import 'components/join_body.dart';

class JoinPage extends StatelessWidget {
  const JoinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // 키보드 올라와도 안깨지게 설정
      body: JoinBody(),
    );
  }
}