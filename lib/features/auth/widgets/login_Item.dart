import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';
import 'package:fooddeliveryapp/features/auth/pages/signin_page.dart';
import 'package:fooddeliveryapp/features/auth/pages/signup_page.dart';
import 'package:fooddeliveryapp/generated/l10n.dart';

// ignore: must_be_immutable
class LoginItem extends StatefulWidget {
  LoginItem({super.key, required this.row});

  Widget row;

  @override
  State<LoginItem> createState() => _LoginItemState();
}

class _LoginItemState extends State<LoginItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 247, 246, 246),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.muted.withValues(alpha: 0.5),
            spreadRadius: 6,
            blurRadius: 9,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: SizedBox(
        height: 250,
        child: Column(
          children: [
            const SizedBox(height: 1),
            Image.asset(
              'assets/images/hat-removebg.png',
              width: 200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SigninPage()),
                    );
                  },
                  child: Text(
                    S.of(context).authSignIn,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpPage()),
                    );
                  },
                  child: Text(
                    S.of(context).authSignUp,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 23),
            widget.row
          ],
        ),
      ),
    );
  }
}
