import 'package:flutter/material.dart';

class CustomIconTextButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final String routeName; // 이동할 페이지의 라우트 이름

  const CustomIconTextButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40.0), // 아이콘 크기 조정 가능
          const SizedBox(height: 8.0),
          Text(text, style: const TextStyle(fontSize: 16.0)), // 텍스트 스타일 조정 가능
        ],
      ),
    );
  }
}
