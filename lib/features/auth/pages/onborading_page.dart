import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';
import 'package:fooddeliveryapp/features/auth/pages/signin_page.dart';
import 'package:fooddeliveryapp/generated/l10n.dart';

class OnboradingPage extends StatelessWidget {
  const OnboradingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 48, 41),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double screenWidth = constraints.maxWidth;
            double screenHeight = constraints.maxHeight;

            return Center(
              child: Column(
                children: [
                  const Spacer(flex: 1),
                  Padding(
                    padding: EdgeInsets.only(right: screenWidth * 0.6),
                    child: Image.asset(
                      'assets/images/hat.png',
                      width: screenWidth * 0.25,
                    ),
                  ),
                  SizedBox(
                    height: screenWidth * 0.03,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: screenWidth * 0.45),
                    child: Text(
                      S.of(context).onboardingFoodFor,
                      style: TextStyle(
                        color: AppColors.white,
                        fontFamily: 'Ubuntu',
                        fontSize: screenWidth * 0.1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: screenWidth * 0.45),
                    child: Text(
                      S.of(context).onboardingEveryone,
                      style: TextStyle(
                        color: AppColors.white,
                        fontFamily: 'Ubuntu',
                        fontSize: screenWidth * 0.1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(flex: 1),
                  Image.asset(
                    'assets/images/cheese-burger.png',
                    width: screenWidth * 0.9,
                  ),
                  const Spacer(flex: 1),
                  SizedBox(
                    width: screenWidth * 0.8,
                    height: screenHeight * 0.08,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SigninPage(),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all<Color>(AppColors.white),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      child: Text(
                        S.of(context).onboardingNext,
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Ubuntu',
                          fontSize: screenWidth * 0.05,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(flex: 1),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
