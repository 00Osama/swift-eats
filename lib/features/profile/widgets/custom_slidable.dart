import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CustomSlidable extends StatelessWidget {
  const CustomSlidable({
    super.key,
    required this.icon,
    required this.label,
    required this.backgroundColor,
    required this.drivers,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final Color backgroundColor;
  final List<dynamic> drivers;
  final void Function(BuildContext)? onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomSlidableAction(
      backgroundColor: backgroundColor,
      borderRadius: BorderRadius.circular(20),
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 28,
          ),
          const SizedBox(height: 6),
          FittedBox(
            child: Text(
              label,
              maxLines: 1,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
