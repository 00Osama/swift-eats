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
        backgroundColor: AppColors.transparent,
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
                category: S.of(context).foodsEditing,
                numberOfCards: 1,
                adminActions: false,
              ),
            ),
          ),
          MyDivider(dividerHeight: 7, verticalSpace: 25),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: DrinksNonActive(),
          ),
          SizedBox(height: 10),
          MyContainer(
            childWidget: SizedBox(
              height: 270,
              child: FoodBuilder(
                category: S.of(context).drinksEditing,
                numberOfCards: 1,
                adminActions: false,
              ),
            ),
          ),
          SizedBox(height: 10),
          MyDivider(dividerHeight: 7, verticalSpace: 25),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: SnacksNonActive(),
          ),
          SizedBox(height: 10),
          MyContainer(
            childWidget: SizedBox(
              height: 270,
              child: FoodBuilder(
                category: S.of(context).snacksEditing,
                numberOfCards: 1,
                adminActions: false,
              ),
            ),
          ),
          SizedBox(height: 10),
          MyDivider(dividerHeight: 7, verticalSpace: 25),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: DessertsNonActive(),
          ),
          SizedBox(height: 10),
          MyContainer(
            childWidget: SizedBox(
              height: 270,
              child: FoodBuilder(
                category: S.of(context).dessertsEditing,
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
