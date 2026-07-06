import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';
import 'package:fooddeliveryapp/features/home/widgets/FoodItem.dart';
import 'package:fooddeliveryapp/features/home/widgets/food_details.dart';
import 'package:fooddeliveryapp/generated/l10n.dart';

// ignore: must_be_immutable
class FoodBuilder extends StatelessWidget {
  const FoodBuilder({
    super.key,
    required this.category,
    required this.numberOfCards,
    required this.adminActions,
  });

  final String category;
  final int numberOfCards;
  final bool adminActions;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    /// responsive card width
    double cardWidth =
        screenWidth < 600 ? screenWidth * 0.45 : screenWidth * 0.30;

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection(category)
          .orderBy('timeStamp', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        /// error
        if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: const TextStyle(fontFamily: 'Ubuntu'),
            ),
          );
        }

        /// loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.neutralButton,
            ),
          );
        }

        /// empty data
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text(
              S().noFoodFound,
              style: TextStyle(
                fontFamily: 'Ubuntu',
              ),
            ),
          );
        }

        List foods = snapshot.data!.docs;

        int itemCount = foods.length <= 5
            ? foods.length
            : numberOfCards == 5
                ? 5
                : foods.length;

        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: itemCount,
          itemBuilder: (context, index) {
            var food = foods[index];

            return Padding(
              padding: const EdgeInsets.only(left: 15),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        foodName: food['foodName'],
                        foodPrice: food['foodPrice'],
                        image: food['foodImage'],
                        food: food,
                      ),
                    ),
                  );
                },
                child: SizedBox(
                  width: cardWidth,
                  child: FoodItem(
                    food: food,
                    category: category,
                    adminActions: adminActions,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
