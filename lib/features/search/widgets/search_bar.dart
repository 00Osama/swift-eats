import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';
import 'package:fooddeliveryapp/features/search/pages/search.dart';
import 'package:fooddeliveryapp/generated/l10n.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showSearch(context: context, delegate: Search());
      },
      child: Container(
        width: 300,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.muted.withValues(alpha: 1),
              spreadRadius: 2,
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Spacer(flex: 1),
            Text(
              '${S.of(context).search}',
              style: TextStyle(
                fontFamily: 'Ubuntu',
              ),
            ),
            Spacer(
              flex: 12,
            ),
            Padding(
              padding: EdgeInsets.only(right: 19),
              child: Icon(
                Icons.search,
                color: Color.fromARGB(162, 0, 0, 0),
              ),
            ),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
