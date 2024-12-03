// ignore_for_file: must_be_immutable

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType textInputType;
  final String hintText;
  final Widget? suffixIcon;
  final String errorMessage;
  final String? emailErrorMessage;
  final String? passwordErrorMessage;
  Function? onChanged;
  bool isPassword;

  CustomTextField({
    super.key,
    required this.textInputType,
    required this.hintText,
    required this.errorMessage,
    this.isPassword = false,
    this.controller,
    this.suffixIcon,
    this.emailErrorMessage,
    this.passwordErrorMessage,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value != null && value.trim().isEmpty) {
          return errorMessage;
        }
        if (value != null && !EmailValidator.validate(value)) {
          return emailErrorMessage;
        }

        return null;
      },
      onChanged: (value) {
        onChanged!();
      },
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: textInputType,
      obscureText: isPassword,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
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
