import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';
import 'package:fooddeliveryapp/generated/l10n.dart';

class ManageOrdersPrice extends StatelessWidget {
  const ManageOrdersPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child:
                    CircularProgressIndicator(color: AppColors.neutralButton));
          }

          var userData = snapshot.data?.data();

          if (userData == null) {
            return Center(
              child: Text(
                S.of(context).noDataFound,
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                ),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.skeletonDark,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).driverOrdersLabel,
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        userData['orders'].toString(),
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      width: 4,
                      decoration: BoxDecoration(
                        color: AppColors.muted,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).driverSalaryLabel,
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        ((userData['orders'] * userData['salaryPerOrder'])
                                .toString())
                            .toString(),
                        style: const TextStyle(
                          fontFamily: 'Ubuntu',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
