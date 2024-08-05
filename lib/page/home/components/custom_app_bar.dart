import 'package:flutter/material.dart';
import 'package:the_boxes/page/setting/setting_page.dart';
import 'package:the_boxes/_core/constants/size.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueAccent,
      title: Text(
        title,
        style: TextStyle(fontSize: ml_gap, color: Colors.white),
      ),
      centerTitle: true, // Ensures the title is centered
      actions: [
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            // Navigate to SettingPage
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingPage()),
            );
          },
        ),
      ],
    );
  }
}
