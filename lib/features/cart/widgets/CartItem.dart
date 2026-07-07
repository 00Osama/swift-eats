import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';
import 'package:fooddeliveryapp/core/widgets/my_shimmer_image.dart';

// ignore: must_be_immutable
class CartItem extends StatefulWidget {
  CartItem({
    super.key,
    required this.item,
  });

  DocumentSnapshot item;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.muted.withValues(alpha: 1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(10, 10),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyShimmerImage(
              profileImageUrl: widget.item['image'],
              size: 75,
            ),
            SizedBox(width: 3),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 115,
                    child: Text(
                      widget.item['name'],
                      style: const TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 17,
                        color: Color.fromARGB(255, 24, 11, 11),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(
                      '${int.parse(widget.item['price']) * int.parse(widget.item['quantity'])} \$',
                      style: const TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 17,
                        color: AppColors.primary,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 7, bottom: 10),
                    child: Container(
                      height: 25,
                      width: 72,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (int.parse(widget.item['quantity']) > 1) {
                                  widget.item.reference.update({
                                    'quantity':
                                        (int.parse(widget.item['quantity']) - 1)
                                            .toString()
                                  });
                                }
                              });
                            },
                            child: Image.asset(
                              'assets/images/minus.png',
                              width: 19,
                              color: AppColors.white,
                            ),
                          ),
                          Text(
                            widget.item['quantity'],
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.item.reference.update({
                                  'quantity':
                                      (int.parse(widget.item['quantity']) + 1)
                                          .toString()
                                });
                              });
                            },
                            child: const Icon(
                              Icons.add_rounded,
                              color: AppColors.white,
                              size: 19,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
