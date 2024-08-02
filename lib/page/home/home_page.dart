import 'package:flutter/material.dart';

import 'components/custom_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(), // Use your custom AppBar
      body: Center(
        child: Text('Welcome to the Home Page'),
      ),
    );
  }
}
