import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartCustomSlideAction extends StatelessWidget {
  const CartCustomSlideAction({
    required this.color,
    required this.icon,
    required this.onTap,
  });

  final Color color;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomSlidableAction(
        onPressed: (_) => onTap(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        padding: EdgeInsets.zero,
        borderRadius: BorderRadius.zero,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(22),
          ),
          alignment: Alignment.center,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
