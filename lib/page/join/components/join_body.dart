import 'package:flutter/material.dart';
import 'package:the_boxes/_core/constants/size.dart';

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
              JoinForm(),
              const SizedBox(height: l_gap),
            ],
          ),
        ),
      ),
    );
  }
}
