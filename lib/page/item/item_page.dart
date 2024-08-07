import 'package:flutter/material.dart';
import 'package:the_boxes/page/home/components/custom_app_bar.dart';

import 'item_body.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '품목'),
      body: ItemBody(),
    );
  }
}
