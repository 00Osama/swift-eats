import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.errorText,
    this.inputType,
    required this.readOnly,
  });
  final TextEditingController controller;
  final String hintText;
  final String? errorText;
  final bool obscureText;
  final TextInputType? inputType;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        readOnly: readOnly,
        keyboardType: inputType,
        obscureText: obscureText,
        cursorColor: AppColors.secondary,
        controller: controller,
        decoration: InputDecoration(
          errorText: errorText,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.muted, width: 2.0),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.muted, width: 2.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.muted, width: 2.0),
          ),
          labelText: hintText,
          labelStyle: const TextStyle(color: AppColors.muted),
        ),
      ),
    );
  }
}
