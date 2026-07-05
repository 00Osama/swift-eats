import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';
import 'package:fooddeliveryapp/generated/l10n.dart';
import 'package:fooddeliveryapp/features/home/widgets/FoodBuilder.dart';
import 'package:fooddeliveryapp/features/home/widgets/FoodCategory.dart';
import 'package:fooddeliveryapp/features/cart/pages/cart_page.dart';
import 'package:fooddeliveryapp/features/home/widgets/see_more.dart';
import 'package:fooddeliveryapp/features/search/widgets/search_bar.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({super.key});

  Widget foods = const FoodsActive();
  Widget drinks = const DrinksNonActive();
  Widget snacks = const SnacksNonActive();
  Widget desserts = const DessertsNonActive();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget food = const FoodBuilder(
    category: 'Foods    ',
    numberOfCards: 5,
    adminActions: false,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CartPage(),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.shopping_cart_outlined,
                        size: 27,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.11),
            Container(
              padding: const EdgeInsets.only(left: 20),
              width: double.infinity,
              child: Text(
                S.of(context).deliciousFood,
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              width: double.infinity,
              child: Text(
                S.of(context).foodForYou,
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const AppSearchBar(),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: SizedBox(
                height: 20,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.foods = const FoodsActive();
                          widget.drinks = const DrinksNonActive();
                          widget.snacks = const SnacksNonActive();
                          widget.desserts = const DessertsNonActive();
                          food = const FoodBuilder(
                            category: 'Foods    ',
                            numberOfCards: 5,
                            adminActions: false,
                          );
                        });
                      },
                      child: widget.foods,
                    ),
                    const SizedBox(width: 45),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.foods = const FoodsNonActive();
                          widget.drinks = const DrinksActive();
                          widget.snacks = const SnacksNonActive();
                          widget.desserts = const DessertsNonActive();
                          food = const FoodBuilder(
                            category: 'Drinks    ',
                            numberOfCards: 5,
                            adminActions: false,
                          );
                        });
                      },
                      child: widget.drinks,
                    ),
                    const SizedBox(width: 45),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.foods = const FoodsNonActive();
                          widget.drinks = const DrinksNonActive();
                          widget.snacks = const SnacksActive();
                          widget.desserts = const DessertsNonActive();
                          food = const FoodBuilder(
                            category: 'Snacks    ',
                            numberOfCards: 5,
                            adminActions: false,
                          );
                        });
                      },
                      child: widget.snacks,
                    ),
                    const SizedBox(width: 45),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.foods = const FoodsNonActive();
                          widget.drinks = const DrinksNonActive();
                          widget.snacks = const SnacksNonActive();
                          widget.desserts = const DessertsActive();
                          food = const FoodBuilder(
                            category: 'Desserts    ',
                            numberOfCards: 5,
                            adminActions: false,
                          );
                        });
                      },
                      child: widget.desserts,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SeeMore(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).seeMore,
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.skeletonBase,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.muted.withValues(alpha: 0.5),
                      spreadRadius: 0,
                      blurRadius: 15,
                      offset: const Offset(10, 10),
                    ),
                  ],
                ),
                child: food,
              ),
            ),
            const SizedBox(height: 27),
          ],
        ),
      ),
    );
  }
}
