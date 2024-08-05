import 'package:flutter/material.dart';
import 'package:the_boxes/page/home/components/custom_app_bar.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '설정'),
    );
  }
}
