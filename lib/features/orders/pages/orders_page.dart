import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';
import 'package:fooddeliveryapp/generated/l10n.dart';
import 'package:fooddeliveryapp/features/orders/widgets/OrderItem.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({
    super.key,
    required this.role,
  });

  final String role;

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        backgroundColor: AppColors.transparent,
        shadowColor: AppColors.transparent,
        title: Center(
          child: Text(
            S.of(context).ordersOnTheWay,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser!.email)
                    .collection('orders')
                    .orderBy('timeStamp', descending: false)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: AppColors.neutralButton,
                    ));
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text(S
                          .of(context)
                          .profileErrorWithDetails(snapshot.error.toString())),
                    );
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(child: Text(S.of(context).noOrdersFound));
                  }

                  List orders = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> data =
                          orders[index].data()! as Map<String, dynamic>;

                      return Column(
                        children: [
                          OrderItem(
                            address: data['address'],
                            image: data['foodImage'],
                            name: data['name'],
                            order: data['foodName'],
                            phoneNumber: data['phoneNumber'],
                            quantity: data['quantity'],
                            totalPrice: data['foodTotalPrice'],
                            securityCode: data['securityKey'],
                            role: widget.role,
                          ),
                          const SizedBox(height: 22)
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
