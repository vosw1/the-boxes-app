import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_boxes/_core/constants/size.dart';
import 'package:the_boxes/components/custom_elavated_button.dart';
import 'package:the_boxes/data/store/session_store.dart';
import 'package:the_boxes/page/home/components/custom_app_bar.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(title: '설정'),
      body: Padding(
        padding: const EdgeInsets.all(s_gap),
        child: SizedBox(
            child: CustomElevatedButton(text: '로그아웃', funPageRoute: () async {
              // SessionStore의 logout 메서드 호출
              final sessionStore = ref.read(sessionProvider);
              sessionStore.logout();
              if(!sessionStore.isLogin){
                print('login form 로그아웃 성공');
                // 로그인 성공 시 Home 페이지로 이동
                Navigator.of(context).pushReplacementNamed('/login'); // Navigate to HomePage
              } else {
                // 로그인 실패 시 에러 메시지 표시
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('로그아웃 실패. 다시 시도해 주세요.')),
                );
              }
            }, )
        ),
      ),
    );
  }
}
