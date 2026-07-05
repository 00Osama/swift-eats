import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';
import 'package:fooddeliveryapp/core/widgets/MyButton.dart';
import 'package:fooddeliveryapp/core/widgets/MyTextfield.dart';
import 'package:fooddeliveryapp/core/helpers/error_message.dart';
import 'package:fooddeliveryapp/features/auth/pages/forget_password.dart';
import 'package:fooddeliveryapp/features/auth/widgets/auth_gate.dart';
import 'package:fooddeliveryapp/features/auth/widgets/auth_service.dart';
import 'package:fooddeliveryapp/features/auth/widgets/login_Item.dart';
import 'package:fooddeliveryapp/features/auth/widgets/login_row.dart';
import 'package:fooddeliveryapp/generated/l10n.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? emailErrorText;
  String? passwordErrorText;
  final auth = AuthService();

  void SignIn() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(color: AppColors.black),
      ),
    );
    try {
      await auth.signIn(
          emailController.text.trim(), passwordController.text.trim());
      Navigator.pop(context);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const AuthGate()),
        (route) => false,
      );
    } catch (e) {
      if (e.toString().contains('user-not-found')) {
        emailErrorText = S.of(context).userNotFound;
        setState(() {});
      } else if (e.toString().contains('wrong-password')) {
        passwordErrorText = S.of(context).wrongPassword;
        setState(() {});
      } else {
        message(
          context,
          title: S.of(context).error,
          content: e.toString(),
          buttonText: S.of(context).ok,
          onPressed: () {
            Navigator.pop(context);
          },
        );
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView(
        children: [
          LoginItem(row: const LoginRow()),
          const SizedBox(height: 30),
          MyTextField(
            readOnly: false,
            controller: emailController,
            hintText: S.of(context).emailAddress,
            obscureText: false,
            errorText: emailErrorText,
          ),
          const SizedBox(height: 20),
          MyTextField(
            readOnly: false,
            controller: passwordController,
            hintText: S.of(context).password,
            obscureText: true,
            errorText: passwordErrorText,
          ),
          const SizedBox(height: 40),
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                S.of(context).forgotPassword,
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return ForgetPasswordScreen();
                },
              ));
            },
          ),
          const SizedBox(height: 130),
          MyButton(
            color: AppColors.primary,
            text: S.of(context).signIn,
            onPressed: () {
              emailErrorText = auth.checkSigninCredential(
                credential: 'email',
                emailController: emailController,
                passwordController: passwordController,
                context: context,
              );
              passwordErrorText = auth.checkSigninCredential(
                credential: 'password',
                emailController: emailController,
                passwordController: passwordController,
                context: context,
              );

              setState(() {});
              if (auth.checkSigninCredential(
                    credential: 'signin',
                    emailController: emailController,
                    passwordController: passwordController,
                    context: context,
                  ) ==
                  S.of(context).validSignin) {
                SignIn();
              }
            },
          )
        ],
      ),
    );
  }
}

