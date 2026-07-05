import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';
import 'package:fooddeliveryapp/features/profile/admin_permissions_pages/add_new_food.dart';
import 'package:fooddeliveryapp/features/profile/admin_permissions_pages/change_role.dart';
import 'package:fooddeliveryapp/features/profile/admin_permissions_pages/edit_foods.dart';
import 'package:fooddeliveryapp/features/profile/admin_permissions_pages/edit_order_time.dart';
import 'package:fooddeliveryapp/features/profile/admin_permissions_pages/manage_drivers.dart';
import 'package:fooddeliveryapp/features/profile/basic_profile_pages/account_info_page.dart';
import 'package:fooddeliveryapp/features/profile/basic_profile_pages/customize_theme_and_locale_page.dart';
import 'package:fooddeliveryapp/features/profile/widgets/driver_salary_and_orders_board.dart';
import 'package:fooddeliveryapp/features/profile/widgets/profile_category.dart';
import 'package:fooddeliveryapp/generated/l10n.dart';
import 'package:shimmer/shimmer.dart';

class ProFilePage extends StatelessWidget {
  const ProFilePage({
    super.key,
    required this.role,
  });

  final String? role;

  @override
  Widget build(BuildContext context) {
    String pageTitle;
    if (role == 'driver') {
      pageTitle = S.of(context).profileDriver;
    } else if (role == 'admin') {
      pageTitle = S.of(context).profileAdmin;
    } else {
      pageTitle = S.of(context).profile;
    }

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        backgroundColor: AppColors.transparent,
        shadowColor: AppColors.transparent,
        title: Center(
          child: Text(
            pageTitle,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            const SizedBox(height: 10),
            FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('users')
                  .doc(FirebaseAuth.instance.currentUser!.email)
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20),
                        Shimmer.fromColors(
                          baseColor: AppColors.skeletonBase,
                          highlightColor: AppColors.skeletonHighlight,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                          ),
                        ),
                        SizedBox(height: 20),
                        Shimmer.fromColors(
                          baseColor: AppColors.skeletonBase,
                          highlightColor: AppColors.skeletonHighlight,
                          child: Container(
                            height: 20,
                            width: 150,
                            color: AppColors.skeletonBase,
                          ),
                        ),
                        SizedBox(height: 40),
                        Shimmer.fromColors(
                          baseColor: AppColors.skeletonBase,
                          highlightColor: AppColors.skeletonHighlight,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  color: AppColors.skeletonBase,
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Container(
                                    height: 20,
                                    color: AppColors.skeletonBase,
                                  ),
                                ),
                                SizedBox(width: 16),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: AppColors.skeletonBase,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                        S.of(context).profileErrorWithDetails(snapshot.error!)),
                  );
                }

                var userData = snapshot.data!.data() as Map<String, dynamic>;
                return Column(
                  children: [
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10000),
                        child: FancyShimmerImage(
                          imageUrl: userData['profileImage'],
                          shimmerBaseColor: AppColors.skeletonDark,
                          shimmerHighlightColor: AppColors.white,
                          boxFit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      userData['FullName'],
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 63, 72, 87),
                      ),
                    ),
                    const SizedBox(height: 10),

                    //////////////////////////////////////////////////////////////////////
                    role == 'driver'
                        ? DriverSalaryAndOrdersBoard(userData: userData)
                        : SizedBox(),
                    //////////////////////////////////////////////////////////////////////
                  ],
                );
              },
            ),
            const SizedBox(height: 10),
            ProfileCategory(
              category: S.of(context).accountInfo,
              icon: Icon(Icons.person_rounded,
                  color: AppColors.skeletonHighlight),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AccountInfo(),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            ProfileCategory(
              category: S.of(context).customizeThemeAndLanguage,
              icon: Icon(Icons.interests_rounded,
                  color: AppColors.skeletonHighlight),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ThemeAndLocale(),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),

            //////////////////////////////////////////////////////////////////////
            role == 'admin'
                ? ProfileCategory(
                    category: S.of(context).editFoods,
                    icon: Icon(Icons.admin_panel_settings_rounded,
                        color: AppColors.skeletonHighlight),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditFoods(),
                        ),
                      );
                    },
                  )
                : SizedBox(),

            const SizedBox(height: 10),

            role == 'admin'
                ? ProfileCategory(
                    category: S.of(context).addNewFood,
                    icon: Icon(Icons.add_rounded,
                        color: AppColors.skeletonHighlight),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddNewFood(),
                        ),
                      );
                    },
                  )
                : SizedBox(),

            const SizedBox(height: 10),

            role == 'admin'
                ? ProfileCategory(
                    category: S.of(context).manageDrivers,
                    icon: Icon(Icons.delivery_dining,
                        color: AppColors.skeletonHighlight),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ManageDrivers(),
                        ),
                      );
                    },
                  )
                : SizedBox(),

            const SizedBox(height: 10),

            role == 'admin'
                ? ProfileCategory(
                    category: S.of(context).changeRoles,
                    icon: Icon(Icons.edit_rounded,
                        color: AppColors.skeletonHighlight),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangeRole(),
                        ),
                      );
                    },
                  )
                : SizedBox(),

            const SizedBox(height: 10),

            role == 'admin'
                ? ProfileCategory(
                    category: S.of(context).editOrderTime,
                    icon: Icon(Icons.access_time_rounded,
                        color: AppColors.skeletonHighlight),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditOrderTime(),
                        ),
                      );
                    },
                  )
                : SizedBox(),
            //////////////////////////////////////////////////////////////////////
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
