import 'package:flutter/material.dart';
import 'components/custom_app_bar.dart';
import 'home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'The Boxes', icon: Icons.settings), // Use your custom AppBar
      body: HomeBody(),
    );
  }
}
