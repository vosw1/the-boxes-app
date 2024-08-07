import 'package:flutter/material.dart';
import 'package:the_boxes/page/home/components/custom_app_bar.dart';

import 'components/in_out_location_body.dart';

class InOutLocationPage extends StatelessWidget {
  const InOutLocationPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '입출고처'),
      body: InOutLocationBody(),
    );
  }
}
