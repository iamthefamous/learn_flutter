
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final VoidCallback onPressed;


  const CustomTextButton({super.key, required this.text, this.fontWeight = FontWeight.normal, this.fontSize = 16.0, required this.onPressed,});

  void _forgotPassword() {

  }

  @override
  Widget build(BuildContext context) {

      return TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: fontSize, // Apply the customizable font size here
            fontWeight: fontWeight,
          ),
        ),
    );
  }
}

