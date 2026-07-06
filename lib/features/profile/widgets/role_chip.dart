import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/generated/l10n.dart';

class RoleChip extends StatelessWidget {
  const RoleChip({
    super.key,
    required this.role,
  });

  final String role;

  Color _color() {
    switch (role.toLowerCase()) {
      case 'admin':
        return Colors.deepPurple;
      case 'driver':
        return Colors.green;
      default:
        return Colors.blue;
    }
  }

  String _roleName(BuildContext context) {
    switch (role.toLowerCase()) {
      case 'admin':
        return S.of(context).adminRole;
      case 'driver':
        return S.of(context).driverRole;
      case 'user':
        return S.of(context).userRole;
      default:
        return role;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _color();

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .12),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.verified_user_rounded,
            color: color,
            size: 18,
          ),
          const SizedBox(width: 6),
          Text(
            _roleName(context),
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontFamily: 'Ubuntu',
            ),
          ),
        ],
      ),
    );
  }
}
