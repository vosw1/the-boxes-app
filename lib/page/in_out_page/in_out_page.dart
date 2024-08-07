import 'package:flutter/material.dart';
import 'package:the_boxes/page/home/components/custom_app_bar.dart';
import 'package:the_boxes/page/in_out_page/components/in_out_body.dart';

class InOutPage extends StatelessWidget {
  const InOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '입출고'),
      body: InOutBody(),
    );
  }
}

