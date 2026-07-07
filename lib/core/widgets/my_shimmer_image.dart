import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';

class MyShimmerImage extends StatelessWidget {
  const MyShimmerImage({
    super.key,
    required this.profileImageUrl,
    required this.size,
  });

  final String profileImageUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        width: size,
        height: size,
        child: profileImageUrl != 'defaultImage' &&
                profileImageUrl.trim().isNotEmpty
            ? FancyShimmerImage(
                imageUrl: profileImageUrl,
                width: size,
                height: size,
                boxFit: BoxFit.cover,
                shimmerBaseColor: AppColors.skeletonDark,
                shimmerHighlightColor: AppColors.white,
                errorWidget: Container(
                  color: const Color.fromARGB(23, 244, 67, 54),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.error_outline_rounded,
                    color: Colors.red,
                  ),
                ),
              )
            : Image.asset(
                'assets/images/defult person.jpg',
                width: size,
                height: size,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
