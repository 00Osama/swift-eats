import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/features/auth/pages/onborading_page.dart';
import 'package:fooddeliveryapp/features/auth/pages/verify_email_checker.dart';
import 'package:fooddeliveryapp/generated/l10n.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width >= 600;
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while waiting for the authentication state
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Handle error state
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isTablet ? 32 : 16,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/error.png',
                      width: isTablet ? 280 : 260,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: isTablet ? 70 : 50),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        S.of(context).unExpectedError,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: isTablet ? 24 : 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        } else if (snapshot.hasData) {
          // If the user is authenticated, show the main app controller
          return const VerifyEmailChecker();
        } else {
          // If the user is not authenticated, show onboarding page
          return const OnboradingPage();
        }
      },
    );
  }
}
