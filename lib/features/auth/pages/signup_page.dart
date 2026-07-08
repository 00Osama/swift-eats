import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';
import 'package:fooddeliveryapp/core/widgets/MyTextfield.dart';
import 'package:fooddeliveryapp/core/widgets/MyButton.dart';
import 'package:fooddeliveryapp/core/helpers/error_message.dart';
import 'package:fooddeliveryapp/features/auth/pages/choose_profile_photo.dart';
import 'package:fooddeliveryapp/features/auth/widgets/auth_service.dart';
import 'package:fooddeliveryapp/features/auth/widgets/auth_Item.dart';
import 'package:fooddeliveryapp/features/auth/widgets/signup_row.dart';
import 'package:fooddeliveryapp/global_fields.dart';
import 'package:fooddeliveryapp/generated/l10n.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? fullNameErrorText;
  String? phoneNumberErrorText;
  String? emailErrorText;
  String? passwordErrorText;
  String? confirmPasswordErrorText;
  final auth = AuthService();

  Future<bool> userExists(String email) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();

    return querySnapshot.docs.isNotEmpty;
  }

  void signUp(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(color: AppColors.black),
      ),
    );

    try {
      bool exists = await userExists(emailController.text.trim());

      Navigator.pop(context);

      if (exists) {
        emailErrorText = S.of(context).userAlreadyExists;
        setState(() {});
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChooseProfilePhoto(),
          ),
        );
      }
    } catch (e) {
      Navigator.pop(context);
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
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView(
        children: [
          AuthItem(authOperation: const SignUpRow()),
          const SizedBox(height: 30),
          MyTextField(
            readOnly: false,
            controller: fullNameController,
            hintText: S.of(context).fullName,
            obscureText: false,
            errorText: fullNameErrorText,
          ),
          const SizedBox(height: 20),
          MyTextField(
            readOnly: false,
            controller: phoneNumberController,
            hintText: S.of(context).phoneNumber,
            obscureText: false,
            errorText: phoneNumberErrorText,
            inputType: TextInputType.number,
          ),
          const SizedBox(height: 20),
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
          const SizedBox(height: 20),
          MyTextField(
            readOnly: false,
            controller: confirmPasswordController,
            hintText: S.of(context).confirmPassword,
            obscureText: true,
            errorText: confirmPasswordErrorText,
          ),
          const SizedBox(height: 50),
          MyButton(
            color: AppColors.primary,
            text: S.of(context).signUp,
            onPressed: () async {
              if (await auth.checkSignUpCredential(
                    credential: 'signup',
                    fullNameController: fullNameController,
                    phoneNumberController: phoneNumberController,
                    emailController: emailController,
                    passwordController: passwordController,
                    confirmPasswordController: confirmPasswordController,
                    context: context,
                  ) ==
                  'invalid signup') {
                // ignore: use_build_context_synchronously
                showDialog(
                  context: context,
                  builder: (context) => const Center(
                    child: CircularProgressIndicator(color: AppColors.black),
                  ),
                );
              }
              fullNameErrorText = await auth.checkSignUpCredential(
                credential: 'fullname',
                fullNameController: fullNameController,
                phoneNumberController: phoneNumberController,
                emailController: emailController,
                passwordController: passwordController,
                confirmPasswordController: confirmPasswordController,
                context: context,
              );
              phoneNumberErrorText = await auth.checkSignUpCredential(
                credential: 'fullname',
                fullNameController: fullNameController,
                emailController: emailController,
                phoneNumberController: phoneNumberController,
                passwordController: passwordController,
                confirmPasswordController: confirmPasswordController,
                context: context,
              );
              emailErrorText = await auth.checkSignUpCredential(
                credential: 'email',
                fullNameController: fullNameController,
                phoneNumberController: phoneNumberController,
                emailController: emailController,
                passwordController: passwordController,
                confirmPasswordController: confirmPasswordController,
                context: context,
              );
              passwordErrorText = await auth.checkSignUpCredential(
                credential: 'password',
                fullNameController: fullNameController,
                emailController: emailController,
                phoneNumberController: phoneNumberController,
                passwordController: passwordController,
                confirmPasswordController: confirmPasswordController,
                context: context,
              );

              confirmPasswordErrorText = await auth.checkSignUpCredential(
                credential: 'confirmPassword',
                fullNameController: fullNameController,
                emailController: emailController,
                phoneNumberController: phoneNumberController,
                passwordController: passwordController,
                confirmPasswordController: confirmPasswordController,
                context: context,
              );
              setState(() {});
              if (await auth.checkSignUpCredential(
                    credential: 'signup',
                    fullNameController: fullNameController,
                    phoneNumberController: phoneNumberController,
                    emailController: emailController,
                    passwordController: passwordController,
                    confirmPasswordController: confirmPasswordController,
                    context: context,
                  ) ==
                  'invalid signup') {
                Navigator.pop(context);
              }

              if (await auth.checkSignUpCredential(
                    credential: 'signup',
                    fullNameController: fullNameController,
                    emailController: emailController,
                    passwordController: passwordController,
                    phoneNumberController: phoneNumberController,
                    confirmPasswordController: confirmPasswordController,
                    context: context,
                  ) ==
                  S.of(context).validSignup) {
                signUp(context);
              }
            },
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
