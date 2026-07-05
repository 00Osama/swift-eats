import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';
import 'package:fooddeliveryapp/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BottomNavSkeleton extends StatelessWidget {
  const BottomNavSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      bottomNavigationBar: Skeletonizer(
        enabled: true,
        child: Container(
          color: AppColors.skeletonBase,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(S.of(context).home, Icons.home_rounded),
                _buildNavItem(
                    S.of(context).myOrders, Icons.room_service_rounded),
                _buildNavItem(S.of(context).profile, Icons.person_rounded),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Skeletonizer(
                  enabled: true,
                  child: Container(
                    margin: EdgeInsets.all(20),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 100),
            Skeletonizer(
              enabled: true,
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text(S.of(context).bottomNavSkeletonTitle),
                  subtitle: Text(S.of(context).bottomNavSkeletonSubtitle),
                  trailing: Icon(Icons.ac_unit),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Skeletonizer(
                    enabled: true,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        width: 150,
                        height: 20,
                        color: AppColors.skeletonBase,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Skeletonizer(
                    enabled: true,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        width: 150,
                        height: 20,
                        color: AppColors.skeletonBase,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Skeletonizer(
                    enabled: true,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        width: 150,
                        height: 20,
                        color: AppColors.skeletonBase,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Skeletonizer(
                    enabled: true,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        width: 150,
                        height: 20,
                        color: AppColors.skeletonBase,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Skeletonizer(
                  enabled: true,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      width: 85,
                      height: 20,
                      color: AppColors.skeletonBase,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Skeletonizer(
                    enabled: true,
                    child: Container(
                      height: 250,
                      width: 220,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Spacer(flex: 1),
                          Skeletonizer(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(90),
                              child: Container(
                                width: 100,
                                height: 100,
                                color: AppColors.muted,
                              ),
                            ),
                          ),
                          Spacer(flex: 2),
                          ListTile(
                            title: Text(S.of(context).bottomNavSkeletonTitle),
                            subtitle:
                                Text(S.of(context).bottomNavSkeletonSubtitle),
                          ),
                          Spacer(flex: 1),
                        ],
                      ),
                    ),
                  ),
                  Skeletonizer(
                    enabled: true,
                    child: Container(
                      height: 250,
                      width: 220,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Spacer(flex: 1),
                          Skeletonizer(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(90),
                              child: Container(
                                width: 100,
                                height: 100,
                                color: AppColors.muted,
                              ),
                            ),
                          ),
                          Spacer(flex: 2),
                          ListTile(
                            title: Text(S.of(context).bottomNavSkeletonTitle),
                            subtitle:
                                Text(S.of(context).bottomNavSkeletonSubtitle),
                          ),
                          Spacer(flex: 1),
                        ],
                      ),
                    ),
                  ),
                  Skeletonizer(
                    enabled: true,
                    child: Container(
                      height: 250,
                      width: 220,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Spacer(flex: 1),
                          Skeletonizer(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(90),
                              child: Container(
                                width: 100,
                                height: 100,
                                color: AppColors.muted,
                              ),
                            ),
                          ),
                          Spacer(flex: 2),
                          ListTile(
                            title: Text(S.of(context).bottomNavSkeletonTitle),
                            subtitle:
                                Text(S.of(context).bottomNavSkeletonSubtitle),
                          ),
                          Spacer(flex: 1),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildNavItem(String title, IconData icon) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: AppColors.skeletonBase, size: 30),
        SizedBox(height: 4),
        Container(
          width: 60,
          height: 8,
          color: AppColors.skeletonBase,
        ),
      ],
    ),
  );
}
