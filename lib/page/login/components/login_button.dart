import 'package:flutter/material.dart';
import 'package:the_boxes/size.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const LoginButton({Key? key, required this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: xx_gap,
      height: l_gap,
      child: TextButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            Navigator.pushNamed(context, "/home");
          }
        },
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blueAccent,
          padding: EdgeInsets.symmetric(vertical: 12.0),
          textStyle: TextStyle(
            fontSize: ml_gap,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Text("Login"),
      ),
    );
  }
}
