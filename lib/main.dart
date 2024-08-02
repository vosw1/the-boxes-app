import 'package:flutter/material.dart';
import 'package:the_boxes/page/home/home_page.dart';
import 'package:the_boxes/page/join/join_page.dart';
import 'package:the_boxes/page/login/login_page.dart';
import 'package:the_boxes/size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 디버그 태그 제거
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // 기본 배경 색상을 흰색으로 설정
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(sl_gap),
            ),
            minimumSize: Size(x_gap, sx_gap),
          ),
        ),
      ),
      initialRoute: "/login", // 초기 화면
      routes: {
        "/login": (context) => LoginPage(),
         "/join": (context) => JoinPage(),
        "/home": (context) => HomePage(),
      },
    );
  }
}
