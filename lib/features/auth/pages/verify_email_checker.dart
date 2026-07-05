import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/generated/l10n.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';
import 'package:fooddeliveryapp/core/widgets/bottom_nav_bar.dart';
import 'package:fooddeliveryapp/core/helpers/error_message.dart';
import 'package:fooddeliveryapp/features/auth/widgets/auth_service.dart';

class VerifyEmailChecker extends StatefulWidget {
  const VerifyEmailChecker({super.key});

  @override
  State<VerifyEmailChecker> createState() => _VerifyEmailCheckerState();
}

class _VerifyEmailCheckerState extends State<VerifyEmailChecker> {
  bool isVerifyedEmail = false;
  bool canResendEmail = false;
  Timer? timer;
  int remainingTime = 59;

  @override
  void initState() {
    super.initState();

    isVerifyedEmail = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isVerifyedEmail) {
      sendVerificationEmail();

      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isVerifyedEmail = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isVerifyedEmail) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      setState(() {
        canResendEmail = false;
        remainingTime = 59;
      });
      Timer.periodic(const Duration(seconds: 1), (Timer t) {
        setState(() {
          if (remainingTime > 0) {
            remainingTime--;
          } else {
            canResendEmail = true;
            t.cancel();
          }
        });
      });
    } on FirebaseAuthException catch (e) {
      message(
        context,
        title: S.of(context).error,
        content: e.message.toString(),
        buttonText: S.of(context).tryAgainLater,
        onPressed: () {
          Navigator.pop(context);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isVerifyedEmail
        ? const MyGnav()
        : Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
              title: Text(S.of(context).verifyEmailTitle),
              backgroundColor: const Color.fromARGB(255, 2, 133, 120),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/verify-email.png',
                  ),
                  Text(
                    S.of(context).verifyEmailCheckInbox,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                  Text(
                    S.of(context).verifyEmailMessage,
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                  const SizedBox(height: 22),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.authAccent,
                      ),
                      onPressed: canResendEmail ? sendVerificationEmail : null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.email_rounded),
                          const SizedBox(width: 8),
                          canResendEmail
                              ? Text(
                                  S.of(context).resendEmail,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Ubuntu',
                                  ),
                                )
                              : Text(
                                  S.of(context).resendEmailIn(remainingTime),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Ubuntu',
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 253, 113, 113),
                      ),
                      onPressed: () {
                        AuthService().signOut();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            S.of(context).cancel,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
