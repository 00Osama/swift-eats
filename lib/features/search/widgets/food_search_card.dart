import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';
import 'package:fooddeliveryapp/core/widgets/my_shimmer_image.dart';

class FoodSearchCard extends StatelessWidget {
  const FoodSearchCard({super.key, required this.food});

  final Map<String, dynamic> food;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              const SizedBox(width: 10),
              ClipOval(
                child: MyShimmerImage(
                    profileImageUrl: food['foodImage'], size: 85),
              ),
              const SizedBox(width: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    food['foodName'],
                    style: const TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 19,
                      color: Color.fromARGB(255, 24, 11, 11),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    food['foodPrice'] + ' ' + '\$',
                    style: const TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
