import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';
import 'package:fooddeliveryapp/features/auth/pages/signin_page.dart';
import 'package:fooddeliveryapp/features/auth/pages/signup_page.dart';
import 'package:fooddeliveryapp/generated/l10n.dart';

class AuthItem extends StatefulWidget {
  const AuthItem({
    super.key,
    required this.authOperation,
  });

  final Widget authOperation;

  @override
  State<AuthItem> createState() => _AuthItemState();
}

class _AuthItemState extends State<AuthItem> {
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
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 250),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 1),
            Image.asset(
              'assets/images/hat-removebg.png',
              width: 200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SigninPage()),
                      );
                    },
                    child: Center(
                      child: Text(
                        S.of(context).authSignIn,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()),
                      );
                    },
                    child: Center(
                      child: Text(
                        S.of(context).authSignUp,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            widget.authOperation,
          ],
        ),
      ),
    );
  }
}
