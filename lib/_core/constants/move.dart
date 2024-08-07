import 'package:flutter/material.dart';
import 'package:the_boxes/page/home/home_page.dart';
import 'package:the_boxes/page/in_out_industruction_page/in_out_industruction_page.dart';
import 'package:the_boxes/page/in_out_location_page/in_out_location.dart';
import 'package:the_boxes/page/in_out_page/in_out_page.dart';
import 'package:the_boxes/page/in_out_status_page/in_out_status_page.dart';
import 'package:the_boxes/page/inventory_status_page/inventory_status_page.dart';
import 'package:the_boxes/page/item/item_page.dart';
import 'package:the_boxes/page/join/join_page.dart';
import 'package:the_boxes/page/login/login_page.dart';
import 'package:the_boxes/page/setting/setting_page.dart';

// navigator로 이동하는 url 설정
class Move {
  static const String loginPage = "/login";
  static const String joinPage = "/join";
  static const String homePage = "/home";
  static const String inoutPage = "/inout";
  static const String itemPage = "/item";
  static const String inoutInstructionPage = "/inout_instruction";
  static const String inoutLocationPage = "/inout_location";
  static const String inventoryStatusPage = "/inventory_status";
  static const String inoutStatusPage = "/inout_status";
  static const String setting = "/setting";
}


// URL에 해당 페이지 연결
Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    "/login": (context) => LoginPage(),
    "/join": (context) => JoinPage(),
    "/home": (context) => HomePage(),
    "/item": (context) => ItemPage(),
    "/inout": (context) => InOutPage(),
    "/inout_instruction": (context) => InOutInstructionPage(),
    "/inout_location": (context) => InOutLocationPage(),
    "/inventory_status": (context) => InventoryStatusPage(),
    "/inout_status": (context) => InOutStatusPage(),
    "/setting": (context) => SettingPage(),
  };
}