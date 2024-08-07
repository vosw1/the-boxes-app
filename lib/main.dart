import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_boxes/page/home/home_page.dart';
import 'package:the_boxes/page/in_out_industruction_page/in_out_industruction_page.dart';
import 'package:the_boxes/page/in_out_location_page/in_out_location.dart';
import 'package:the_boxes/page/in_out_page/in_out_page.dart';
import 'package:the_boxes/page/in_out_status_page/in_out_status_page.dart';
import 'package:the_boxes/page/inventory_status_page/inventory_status_page.dart';
import 'package:the_boxes/page/item/item_page.dart';
import 'package:the_boxes/page/join/join_page.dart';
import 'package:the_boxes/page/login/login_page.dart';
import 'package:the_boxes/_core/constants/size.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      ProviderScope(child: MyApp()));
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
        "/item": (context) => ItemPage(),
        "/inout": (context) => InOutPage(),
        "/inout_instruction": (context) => InOutInstructionPage(),
        "/inout_location": (context) => InOutLocationPage(),
        "/inventory_status": (context) => InventoryStatusPage(),
        "/inout_status": (context) => InOutStatusPage(),
      },
    );
  }
}
