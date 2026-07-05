import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/core/widgets/bottom_nav_skeleton.dart';
import 'package:fooddeliveryapp/features/home/pages/home_page.dart';
import 'package:fooddeliveryapp/features/profile/basic_profile_pages/profile_page.dart';
import 'package:fooddeliveryapp/generated/l10n.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';
import 'package:fooddeliveryapp/features/drivers/pages/driver_page.dart';
import 'package:fooddeliveryapp/features/orders/pages/orders_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyGnav extends StatefulWidget {
  const MyGnav({Key? key}) : super(key: key);

  @override
  State<MyGnav> createState() => _MyGnavState();
}

class _MyGnavState extends State<MyGnav> {
  int _selectedIndex = 0;
  late List<Widget> myScreens;
  String? role;

  @override
  void initState() {
    super.initState();
    _fetchUserRole();
  }

  Future<void> _fetchUserRole() async {
    try {
      DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.email)
          .get();
      setState(() {
        role = userData['role'];
        _buildScreens();
      });
    } catch (e) {
      setState(() {
        role = null;
      });
    }
  }

  void _buildScreens() {
    final secondPage =
        role == 'user' ? OrdersPage(role: role!) : DriverPage(role: role!);

    myScreens = [
      HomePage(),
      secondPage,
      ProFilePage(role: role!),
    ];
  }

  @override
  Widget build(BuildContext context) {
    if (role == null) {
      return BottomNavSkeleton();
    }
    double screenWidth = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    // Colors
    Color iconColor = isDark ? AppColors.skeletonDark : AppColors.muted;
    Color activeColor =
        isDark ? AppColors.skeletonHighlight : AppColors.textPrimary;
    Color tabBorderColor = isDark ? AppColors.muted : AppColors.white;

    // Responsive sizes
    double navPadding = screenWidth < 600 ? 17 : 30;
    double tabBorderRadius = screenWidth < 600 ? 20 : 35;
    double iconSize = screenWidth < 600 ? 24 : 33;

    return Scaffold(
      backgroundColor: AppColors.skeletonDark,
      body: ClipRRect(
        child: myScreens.elementAt(_selectedIndex),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GNav(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          color: iconColor,
          activeColor: activeColor,
          iconSize: iconSize,
          tabActiveBorder: Border.all(color: tabBorderColor),
          tabBorderRadius: tabBorderRadius,
          padding: EdgeInsets.all(navPadding),
          curve: Curves.linear,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          tabs: [
            GButton(
              icon: Icons.home_rounded,
              iconSize: 23,
              text: ' ' + S().home,
              textStyle: TextStyle(
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            GButton(
              icon: Icons.delivery_dining,
              iconSize: 23,
              text: ' ' + S().driver,
              textStyle: TextStyle(
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            GButton(
              icon: Icons.person_rounded,
              iconSize: 23,
              text: ' ' + S().profile,
              textStyle: TextStyle(
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ],
          selectedIndex: _selectedIndex,
        ),
      ),
    );
  }
}
