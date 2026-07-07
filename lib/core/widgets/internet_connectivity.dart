import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/features/auth/widgets/auth_gate.dart';

class InternetConnectivity extends StatelessWidget {
  const InternetConnectivity({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: StreamBuilder<ConnectivityResult>(
        stream: Connectivity().onConnectivityChanged.map(
            (list) => list.isNotEmpty ? list.last : ConnectivityResult.none),
        builder: (context, snapshot) {
          if (snapshot.data == ConnectivityResult.none) {
            return Scaffold(
              backgroundColor: const Color(0xfffafafc),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/nointernet.png',
                      width: screenHeight * 0.5,
                      height: screenHeight * 0.25,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    Text(
                      'لا يوجد اتصال بالانترنت',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.05,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const AuthGate();
          }
        },
      ),
    );
  }
}
