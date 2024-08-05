import 'package:flutter/material.dart';
import 'package:the_boxes/size.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget { // 크기를 제어하기 위해 인터페이스 구현
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); // 높이를 정의 => Flutter의 기본 툴바 높이

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(fontSize: ml_gap, color: Colors.white), // Use your custom size
      ),
      centerTitle: true, // 아이콘이 있어도 가운데 정렬
      backgroundColor: Colors.blueAccent,
    );
  }
}
