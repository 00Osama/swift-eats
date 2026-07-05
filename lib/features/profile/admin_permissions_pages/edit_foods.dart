import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/features/home/widgets/FoodCategory.dart';
import 'package:fooddeliveryapp/features/home/widgets/FoodBuilder.dart';
import 'package:fooddeliveryapp/core/widgets/MyDivider.dart';
import 'package:fooddeliveryapp/generated/l10n.dart';
import 'package:fooddeliveryapp/features/home/widgets/see_more.dart';

class EditFoods extends StatefulWidget {
  const EditFoods({super.key});

  @override
  State<EditFoods> createState() => _EditFoodsState();
}

class _EditFoodsState extends State<EditFoods> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          S.of(context).editFoods,
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Ubuntu',
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: FoodsNonActive(),
          ),
          const SizedBox(height: 10),
          MyContainer(
            childWidget: SizedBox(
              height: 270,
              child: FoodBuilder(
                category: 'Foods    ',
                numberOfCards: 1,
                adminActions: true,
              ),
            ),
          ),
          const MyDivider(dividerHeight: 7, verticalSpace: 25),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: DrinksNonActive(),
          ),
          const SizedBox(height: 10),
          MyContainer(
            childWidget: SizedBox(
              height: 270,
              child: FoodBuilder(
                category: 'Drinks    ',
                numberOfCards: 1,
                adminActions: true,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const MyDivider(dividerHeight: 7, verticalSpace: 25),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: SnacksNonActive(),
          ),
          const SizedBox(height: 10),
          MyContainer(
            childWidget: SizedBox(
              height: 270,
              child: FoodBuilder(
                category: 'Snacks    ',
                numberOfCards: 1,
                adminActions: true,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const MyDivider(dividerHeight: 7, verticalSpace: 25),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: DessertsNonActive(),
          ),
          const SizedBox(height: 10),
          MyContainer(
            childWidget: SizedBox(
              height: 270,
              child: FoodBuilder(
                category: 'Desserts    ',
                numberOfCards: 1,
                adminActions: true,
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
