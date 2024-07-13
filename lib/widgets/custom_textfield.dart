import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextInputType textInputType;
  final bool isPassword;
  final String hintText;
  const CustomTextField({
    super.key,
    required this.textInputType,
    required this.isPassword,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      obscureText: isPassword,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(8),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: Divider.createBorderSide(context),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        filled: true,
      ),
    );
  }
}
