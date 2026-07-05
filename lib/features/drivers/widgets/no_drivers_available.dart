import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/generated/l10n.dart';

class NoDriversAvailable extends StatelessWidget {
  const NoDriversAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        S.of(context).noAvailableOrders,
      ),
    );
  }
}
