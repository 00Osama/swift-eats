import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';
import 'package:fooddeliveryapp/features/home/widgets/FoodBuilder.dart';
import 'package:fooddeliveryapp/features/home/widgets/FoodCategory.dart';
import 'package:fooddeliveryapp/core/widgets/MyDivider.dart';
import 'package:fooddeliveryapp/generated/l10n.dart';

class SeeMore extends StatelessWidget {
  const SeeMore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        shadowColor: AppColors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Spacer(flex: 1),
            Text(
              S.of(context).allAvailableFoods,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 10),
          SizedBox(height: 17),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: FoodsNonActive(),
          ),
          SizedBox(height: 10),
          MyContainer(
            childWidget: SizedBox(
              height: 270,
              child: FoodBuilder(
                category: 'Foods    ',
                numberOfCards: 1,
                adminActions: false,
              ),
            ),
          ),
          MyDivider(dividerHeight: 5, verticalSpace: 25),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: DrinksNonActive(),
          ),
          SizedBox(height: 10),
          MyContainer(
            childWidget: SizedBox(
              height: 270,
              child: FoodBuilder(
                category: 'Drinks    ',
                numberOfCards: 1,
                adminActions: false,
              ),
            ),
          ),
          SizedBox(height: 10),
          MyDivider(dividerHeight: 5, verticalSpace: 25),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: SnacksNonActive(),
          ),
          SizedBox(height: 10),
          MyContainer(
            childWidget: SizedBox(
              height: 270,
              child: FoodBuilder(
                category: 'Snacks    ',
                numberOfCards: 1,
                adminActions: false,
              ),
            ),
          ),
          SizedBox(height: 10),
          MyDivider(dividerHeight: 5, verticalSpace: 25),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: DessertsNonActive(),
          ),
          SizedBox(height: 10),
          MyContainer(
            childWidget: SizedBox(
              height: 270,
              child: FoodBuilder(
                category: 'Desserts    ',
                numberOfCards: 1,
                adminActions: false,
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  MyContainer({
    required this.childWidget,
    super.key,
  });

  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.skeletonBase,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.muted.withValues(alpha: 0.5),
            spreadRadius: 0,
            blurRadius: 40,
            offset: const Offset(10, 10),
          ),
        ],
      ),
      child: childWidget,
    );
  }
}
