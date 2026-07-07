import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';
import 'package:fooddeliveryapp/features/cart/widgets/CartItem.dart';
import 'package:fooddeliveryapp/features/cart/widgets/cart_custom_slidable_action.dart';
import 'package:fooddeliveryapp/features/orders/pages/confirm_order.dart';
import 'package:fooddeliveryapp/generated/l10n.dart';

class CartBuilder extends StatefulWidget {
  const CartBuilder({super.key});

  @override
  State<CartBuilder> createState() => _CartBuilderState();
}

class _CartBuilderState extends State<CartBuilder> {
  String? role;
  int currentHourTime = DateTime.now().hour;
  int? start;
  int? end;

  Future<void> _fetchUserRole() async {
    DocumentSnapshot userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .get();

    if (mounted) {
      setState(() {
        role = userData['role'];
      });
    }
  }

  Future<void> checkOrderTime() async {
    DocumentSnapshot timeDoc = await FirebaseFirestore.instance
        .collection('Order Time')
        .doc('time')
        .get();

    start = timeDoc['start'];
    end = timeDoc['end'];
  }

  @override
  void initState() {
    super.initState();
    _fetchUserRole();
    checkOrderTime();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.email)
          .collection('cart')
          .orderBy('timeStamp', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              S.of(context).profileErrorWithDetails(snapshot.error.toString()),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.neutralButton,
            ),
          );
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text(
              S.of(context).noItemsFoundInCart,
              style: const TextStyle(
                fontFamily: 'Ubuntu',
              ),
            ),
          );
        }

        final cart = snapshot.data!.docs;

        return ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartItem = cart[index];

            return Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Slidable(
                endActionPane: ActionPane(
                  motion: const StretchMotion(),
                  extentRatio: .42,
                  children: [
                    CartCustomSlideAction(
                      color: Colors.red.shade500,
                      icon: Icons.delete_rounded,
                      onTap: () {
                        FirebaseFirestore.instance
                            .collection('users')
                            .doc(FirebaseAuth.instance.currentUser!.email)
                            .collection('cart')
                            .doc(cartItem.id)
                            .delete();
                      },
                    ),
                    role == 'user'
                        ? CartCustomSlideAction(
                            color: Colors.green.shade600,
                            icon: Icons.delivery_dining_rounded,
                            onTap: () {
                              if (start != null &&
                                  end != null &&
                                  currentHourTime > start! &&
                                  currentHourTime < end!) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ConfirmOrder(
                                    foodName: cart[index]['name'],
                                    foodPrice: int.parse(cart[index]['price']),
                                    image: cart[index]['image'],
                                    amount: int.parse(cart[index]['quantity']),
                                    ),
                                  ),
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    title: Text(S.of(context).orderNotAllowed),
                                    content: Text(
                                      S.of(context).allowedTimeBetween(
                                            start.toString(),
                                            end.toString(),
                                          ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text(S.of(context).ok),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                          )
                        : SizedBox(),
                  ],
                ),
                child: CartItem(item: cartItem),
              ),
            );
          },
        );
      },
    );
  }
}
