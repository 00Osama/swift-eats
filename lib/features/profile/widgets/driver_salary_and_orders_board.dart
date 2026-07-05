import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';
import 'package:fooddeliveryapp/generated/l10n.dart';

class DriverSalaryAndOrdersBoard extends StatelessWidget {
  const DriverSalaryAndOrdersBoard({
    super.key,
    required this.userData,
  });

  final Map<String, dynamic> userData;

  @override
  Widget build(BuildContext context) {
    final int orders = userData['orders'] ?? 0;
    final num salaryPerOrder = userData['salaryPerOrder'] ?? 0;
    final num totalSalary = orders * salaryPerOrder;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        height: 125,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            colors: [
              AppColors.skeletonDark,
              AppColors.skeletonDark.withOpacity(.88),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: _StatCard(
                title: S.of(context).driverOrders,
                value: orders.toString(),
                iconColor: Colors.orange,
              ),
            ),
            Container(
              width: 1,
              height: 70,
              color: Colors.white.withOpacity(.12),
            ),
            Expanded(
              child: _StatCard(
                title: S.of(context).driverSalary,
                value: totalSalary.toString(),
                iconColor: Colors.greenAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.title,
    required this.value,
    required this.iconColor,
  });

  final String title;
  final String value;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'Ubuntu',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Ubuntu',
              fontSize: 14,
              color: Colors.white.withOpacity(.7),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
