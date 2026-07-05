import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';

class SignUpRow extends StatefulWidget {
  const SignUpRow({super.key});

  @override
  State<SignUpRow> createState() => _SignUpRowState();
}

class _SignUpRowState extends State<SignUpRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: AppColors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(22)),
          ),
          width: 100,
          height: 3,
        ),
        Container(
          decoration: const BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.all(Radius.circular(22)),
          ),
          width: 100,
          height: 3,
        )
      ],
    );
  }
}

