import 'package:flutter/material.dart';
import 'package:the_boxes/components/custom_text_button.dart';
import 'package:the_boxes/size.dart';

import 'join_form.dart';

class JoinBody extends StatelessWidget {
  const JoinBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Scrollbar(
        // Scrollbar 추가
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: ml_gap),
              Text(
                '회원가입',
                style: TextStyle(
                  fontSize: sl_gap, // 글자 크기를 m_gap으로 설정
                  fontWeight: FontWeight.bold, // 텍스트 굵기 설정 (선택사항),
                  color: Colors.blueAccent
                ),
              ),
              const SizedBox(height: ml_gap),
              JoinForm(),
              const SizedBox(height: l_gap),
            ],
          ),
        ),
      ),
    );
  }
}
