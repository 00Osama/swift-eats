import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/generated/l10n.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';
import 'package:fooddeliveryapp/core/widgets/MyTextfield.dart';
import 'package:fooddeliveryapp/core/helpers/error_message.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  String? emailErrorText;
  bool isValidEmail(String email) {
    String emailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regExp = RegExp(emailRegex);
    if (regExp.hasMatch(email)) {
      return true;
    } else {
      return false;
    }
  }

  Future sendPasswordReset(context) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      message(
        context,
        title: S.of(context).success,
        content: S.of(context).passwordResetLinkSent,
        buttonText: S.of(context).ok,
        onPressed: () {
          Navigator.pop(context);
        },
      );
    } on FirebaseAuthException catch (e) {
      message(
        context,
        title: S.of(context).error,
        content: e.message.toString(),
        buttonText: S.of(context).tryAgain,
        onPressed: () {
          Navigator.pop(context);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          S.of(context).resetPasswordTitle,
          style: TextStyle(fontFamily: 'Ubuntu'),
        ),
        backgroundColor: const Color.fromARGB(255, 2, 133, 120),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).resetPasswordHint,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Ubuntu',
              ),
            ),
            Text(
              S.of(context).resetPasswordMessage,
              style: TextStyle(
                fontFamily: 'Ubuntu',
              ),
            ),
            const SizedBox(height: 40),
            MyTextField(
              readOnly: false,
              controller: emailController,
              hintText: S.of(context).emailAddress,
              obscureText: false,
              errorText: emailErrorText,
            ),
            const SizedBox(height: 45),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    AppColors.authAccent,
                  ),
                ),
                onPressed: () {
                  if (!isValidEmail(emailController.text) &&
                      emailController.text.isNotEmpty) {
                    emailErrorText = S.of(context).invalidEmailAddress;
                    setState(() {});
                  } else if (emailController.text.isEmpty) {
                    emailErrorText = S.of(context).thisFieldIsRequired;
                    setState(() {});
                  } else {
                    sendPasswordReset(context);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.email_rounded),
                    Text(
                      ' ${S.of(context).sendEmail}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Color.fromARGB(255, 253, 113, 113),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
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
