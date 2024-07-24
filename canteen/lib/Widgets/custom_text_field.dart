import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData icon;
  final bool obscureText;
  final String? Function(String?)? validator;

  const CustomTextFormField({super.key,
    required this.controller,
    required this.labelText,
    required this.icon,
    this.obscureText = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(

        labelText: labelText,
        prefixIcon:  Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child : Icon(icon),
        ),
        labelStyle: const TextStyle(
          fontSize: 18.0
        ),
      ),
      obscureText: obscureText,
      validator: validator,

    );
  }
}
