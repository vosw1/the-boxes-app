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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
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
      initialRoute: "/login",
      routes: {
        "/login": (context) => LoginPage(),
        "/join": (context) => JoinPage(),
        "/home": (context) => HomePage(),
        // "/settings": (context) => SettingsPage(), // 추가된 페이지
        // "/info": (context) => InfoPage(), // 추가된 페이지
      },
    );
  }
}
