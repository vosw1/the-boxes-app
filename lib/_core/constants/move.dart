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
  static const String inoutPage = "/inout_page";
  static const String itemPage = "/item_page";
  static const String inoutInstructionPage = "/inout_instruction_page";
  static const String inoutLocationPage = "/inout_location_page";
  static const String inventoryStatusPage = "/inventory_status_page";
  static const String inoutStatusPage = "/inout_status_page";
  static const String setting = "/setting";
}


// URL에 해당 페이지 연결
Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    "/login": (context) => LoginPage(),
    "/join": (context) => JoinPage(),
    "/home": (context) => HomePage(),
    "/item_page": (context) => ItemPage(),
    "/inout_page": (context) => InOutPage(),
    "/inout_instruction_page": (context) => InOutInstructionPage(),
    "/inout_location_page": (context) => InOutLocationPage(),
    "/inventory_status_page": (context) => InventoryStatusPage(),
    "/inout_status_page": (context) => InOutStatusPage(),
    "/setting": (context) => SettingPage(),
  };
}