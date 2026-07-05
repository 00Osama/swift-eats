import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/features/drivers/widgets/no_drivers_available.dart';
import 'package:fooddeliveryapp/generated/l10n.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fooddeliveryapp/features/orders/widgets/OrderItem.dart';
import 'package:fooddeliveryapp/global_fields.dart';

class DriverPage extends StatefulWidget {
  const DriverPage({
    super.key,
    required this.role,
  });

  final String role;

  @override
  State<DriverPage> createState() => _DriverPageState();
}

class _DriverPageState extends State<DriverPage> {
  int? Orders;
  Future<int?> _fetchUserOrders() async {
    DocumentSnapshot userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .get();

    Orders = userData['orders'];
    return Orders;
  }

  Stream<List<DocumentSnapshot>> getAllOrdersStream() {
    return FirebaseFirestore.instance
        .collection('users')
        .snapshots()
        .asyncMap((querySnapshot) async {
      List<DocumentSnapshot> allOrders = [];

      for (var userDoc in querySnapshot.docs) {
        var ordersSnapshot = await userDoc.reference.collection('orders').get();
        allOrders.addAll(ordersSnapshot.docs);
      }

      return allOrders;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        title: Center(
          child: Text(
            S().deriverScreen,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        backgroundColor: AppColors.secondary,
        color: AppColors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline_rounded),
                const SizedBox(width: 10),
                Text(
                  S.of(context).makeSureToRefresh,
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: StreamBuilder(
                stream: getAllOrdersStream(),
                builder:
                    (context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                        child: Text(S.of(context).somethingWentWrong));
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: AppColors.neutralButton,
                    ));
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return NoDriversAvailable();
                  }

                  List<DocumentSnapshot> orders = snapshot.data!;

                  // Sort orders by timestamp in ascending order
                  orders.sort((a, b) {
                    Timestamp aTimestamp = a['timeStamp'];
                    Timestamp bTimestamp = b['timeStamp'];
                    return aTimestamp.compareTo(bTimestamp); // Sort ascending
                  });

                  return ListView.builder(
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> orderData =
                          orders[index].data() as Map<String, dynamic>;
                      String id = orders[index].id;

                      return Column(
                        children: [
                          OrderItem(
                            address: orderData['address'],
                            image: orderData['foodImage'],
                            name: orderData['name'],
                            order: orderData['foodName'],
                            phoneNumber: orderData['phoneNumber'],
                            quantity: orderData['quantity'],
                            totalPrice: orderData['foodTotalPrice'],
                            orderId: id,
                            role: widget.role,
                            email: orderData['email'],
                            securityCode: orderData['securityKey'],
                            btnOkOnPress: () async {
                              if (code.text == orderData['securityKey']) {
                                await FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(orderData['email'])
                                    .collection('orders')
                                    .doc(id)
                                    .delete();

                                await _fetchUserOrders();
                                int o = Orders! + 1;

                                FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(FirebaseAuth
                                        .instance.currentUser!.email)
                                    .update({
                                  'orders': o,
                                });
                                Fluttertoast.showToast(
                                  msg: S.of(context).orderConfirmedSuccessfully,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.TOP,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor:
                                      Color.fromARGB(255, 113, 201, 113),
                                  textColor: AppColors.white,
                                  fontSize: 16.0,
                                );
                                code.clear();
                              } else {
                                Fluttertoast.showToast(
                                  msg: S.of(context).orderSecurityCodeIsWrong,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.TOP,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor:
                                      Color.fromARGB(255, 230, 124, 116),
                                  textColor: AppColors.white,
                                  fontSize: 16.0,
                                );
                                code.clear();
                              }
                            },
                          ),
                          const SizedBox(height: 22),
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
