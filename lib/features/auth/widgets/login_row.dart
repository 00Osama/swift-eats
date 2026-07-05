import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';

class LoginRow extends StatefulWidget {
  const LoginRow({super.key});

  @override
  State<LoginRow> createState() => _LoginRowState();
}

class _LoginRowState extends State<LoginRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.all(Radius.circular(22)),
          ),
          width: 100,
          height: 3,
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(22)),
          ),
          width: 100,
          height: 3,
        ),
      ],
    );
  }
}

