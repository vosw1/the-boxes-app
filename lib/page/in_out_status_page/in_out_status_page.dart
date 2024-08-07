import 'package:flutter/material.dart';
import 'package:the_boxes/page/home/components/custom_app_bar.dart';

import 'components/in_out_status_body.dart';

class InOutStatusPage extends StatelessWidget {
  const InOutStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '입출고 현황'),
      body: InOutStatusBody(),
    );
  }
}