import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';
import 'package:fooddeliveryapp/features/auth/widgets/auth_service.dart';
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
            role == 'admin' ? const SizedBox(height: 20) : SizedBox(),
            FractionallySizedBox(
              widthFactor: 0.90,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(178, 244, 67, 54),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 0,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (context) {
                      final theme = Theme.of(context);
                      final colors = theme.colorScheme;

                      return Dialog(
                        elevation: 0,
                        backgroundColor: colors.surface,
                        insetPadding:
                            const EdgeInsets.symmetric(horizontal: 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 64,
                                height: 64,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: colors.errorContainer.withOpacity(.35),
                                ),
                                child: Icon(
                                  Icons.logout_rounded,
                                  size: 30,
                                  color: colors.error,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                S().accountInfoSignOut,
                                style: theme.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                S().signOutConfirmation,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.textTheme.bodyMedium?.color
                                      ?.withOpacity(.7),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Expanded(
                                    child: OutlinedButton(
                                      onPressed: () => Navigator.pop(context),
                                      style: OutlinedButton.styleFrom(
                                        foregroundColor: Colors.green,
                                        side: const BorderSide(
                                          color: Colors.green,
                                          width: 1.5,
                                        ),
                                        minimumSize: const Size.fromHeight(46),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                        ),
                                      ),
                                      child: Text(
                                        S().cancel,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: OutlinedButton(
                                      onPressed: () async {
                                        Navigator.pop(context);
                                        await AuthService().signOut();
                                      },
                                      style: OutlinedButton.styleFrom(
                                        foregroundColor: Colors.red,
                                        side: const BorderSide(
                                          color: Colors.red,
                                          width: 1.5,
                                        ),
                                        minimumSize: const Size.fromHeight(46),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                        ),
                                      ),
                                      child: FittedBox(
                                        child: Text(
                                          S().accountInfoSignOut,
                                          maxLines: 1,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  S.of(context).accountInfoSignOut,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Ubuntu',
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
