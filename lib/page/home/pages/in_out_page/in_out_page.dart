import 'package:flutter/material.dart';
import 'package:the_boxes/page/home/components/custom_app_bar.dart';

class InOutInstructionPage extends StatelessWidget {
  const InOutInstructionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '입출고 지시'),
    );
  }
}
