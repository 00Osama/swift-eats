import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/generated/l10n.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fooddeliveryapp/features/cart/widgets/CartItem.dart';
import 'package:fooddeliveryapp/features/orders/widgets/confirm_order.dart';

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

    setState(() {
      role = userData['role'];
    });
  }

  Future<void> checkOrderTime() async {
    // Fetch the 'time' document from Firestore
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
            child: Text(S
                .of(context)
                .profileErrorWithDetails(snapshot.error.toString())),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(color: AppColors.neutralButton));
        }

        if (snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text(
              S.of(context).noItemsFoundInCart,
              style: const TextStyle(
                fontFamily: 'Ubuntu',
              ),
            ),
          );
        }

        List cart = snapshot.data!.docs;
        return ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            DocumentSnapshot cartItem = cart[index];

            return Column(
              children: [
                Slidable(
                  endActionPane: ActionPane(
                    motion: const StretchMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) async {
                          setState(
                            () {
                              FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(FirebaseAuth.instance.currentUser!.email)
                                  .collection('cart')
                                  .doc(cartItem.id)
                                  .delete();
                            },
                          );
                        },
                        backgroundColor: const Color.fromARGB(166, 219, 13, 13),
                        icon: Icons.delete_rounded,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      role == 'user'
                          ? SlidableAction(
                              onPressed: (context) {
                                if (currentHourTime > start! &&
                                    currentHourTime < end!) {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return ConfirmOrder(
                                        foodName: cart[index]['name'],
                                        foodPrice:
                                            int.parse(cart[index]['price']),
                                        image: cart[index]['image'],
                                        amount:
                                            int.parse(cart[index]['quantity']),
                                      );
                                    },
                                  );
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title:
                                            Text(S.of(context).orderNotAllowed),
                                        content: Text(S
                                            .of(context)
                                            .allowedTimeBetween(
                                                start.toString(),
                                                end.toString())),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(S.of(context).ok),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              },
                              backgroundColor:
                                  const Color.fromARGB(166, 11, 175, 39),
                              icon: Icons.delivery_dining,
                              borderRadius: BorderRadius.circular(20),
                            )
                          : SizedBox(),
                    ],
                  ),
                  child: CartItem(
                    item: cartItem,
                  ),
                ),
                const SizedBox(height: 15),
              ],
            );
          },
        );
      },
    );
  }
}
