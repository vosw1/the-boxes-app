import 'package:flutter/material.dart';
import 'package:the_boxes/size.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;

  const CustomTextFormField(this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: s_gap), // 레이블 이동
          child: Text(
            text,
            style: TextStyle(
              fontSize: m_gap,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: s_gap),
        TextFormField(
          validator: (value) =>
              value!.isEmpty ? "Please enter some text" : null,
          obscureText: text == "Password" ? true : false,
          decoration: InputDecoration(
            hintText: "Enter $text",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(m_gap),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(m_gap),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(m_gap),
            ),
          ),
        )
      ],
    );
  }
}
