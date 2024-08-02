import 'package:flutter/material.dart';
import 'package:the_boxes/size.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'The Boxes',
        style: TextStyle(fontSize: ml_gap, color: Colors.white), // Use your custom size
      ),
      backgroundColor: Colors.blueAccent, // Customize the background color
      actions: [
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            // Add search action
          },
        ),
      ],
    );
  }
}
