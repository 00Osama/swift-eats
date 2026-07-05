import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/generated/l10n.dart';

class EmptySearchSuggestions extends StatelessWidget {
  const EmptySearchSuggestions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              'assets/images/search food.png',
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          S.of(context).youCanSearchFoods,
          style: const TextStyle(
            fontSize: 17,
            fontFamily: 'Ubuntu',
          ),
        ),
      ],
    );
  }
}
