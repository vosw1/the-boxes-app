import 'package:flutter/material.dart';
import 'package:the_boxes/_core/constants/size.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback funPageRoute;

  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.funPageRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // 버튼의 너비를 화면 전체 너비로 설정
      child: ElevatedButton(
        onPressed: funPageRoute,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Colors.blueAccent, // 버튼 텍스트 색상
          padding: EdgeInsets.symmetric(vertical: s_gap, horizontal: s_gap), // 버튼 패딩
          textStyle: TextStyle(
            fontSize: m_gap, // 버튼 텍스트 크기
            fontWeight: FontWeight.bold, // 버튼 텍스트 두께
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(m_gap), // 모서리 둥글게 설정
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
