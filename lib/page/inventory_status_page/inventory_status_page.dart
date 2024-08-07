import 'package:flutter/material.dart';
import 'package:the_boxes/page/home/components/custom_app_bar.dart';

import 'components/inventory_status_body.dart';

class InventoryStatusPage extends StatelessWidget {
  const InventoryStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '재고 현황'),
      body: InventoryStatusBody(),
    );
  }
}