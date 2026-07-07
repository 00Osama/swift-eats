import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/core/widgets/my_shimmer_image.dart';
import 'package:fooddeliveryapp/generated/l10n.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';
import 'package:fooddeliveryapp/features/orders/pages/confirm_order.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    Key? key,
    required this.foodName,
    required this.foodPrice,
    required this.image,
    this.food,
  }) : super(key: key);

  final String image;
  final String foodName;
  final String foodPrice;
  final DocumentSnapshot? food;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String cartText = '';
  bool isCartLoading = false;

  Future<void> checkDocumentExistence() async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('cart')
        .doc(widget.food!.id)
        .get();

    setState(() {
      if (documentSnapshot.exists) {
        cartText = S.of(context).removeFromCart;
      } else {
        cartText = S.of(context).addToCart;
      }
    });
  }

  Future<void> toggleCart() async {
    setState(() {
      isCartLoading = true;
    });

    DocumentReference cartDocRef = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('cart')
        .doc(widget.food!.id);

    try {
      DocumentSnapshot documentSnapshot = await cartDocRef.get();

      if (documentSnapshot.exists) {
        // Remove from cart
        await cartDocRef.delete();
      } else {
        // Add to cart
        await cartDocRef.set({
          'image': widget.image,
          'name': widget.foodName,
          'price': widget.foodPrice,
          'timeStamp': Timestamp.now(),
          'quantity': '1',
        });
      }

      await checkDocumentExistence(); // Refresh the button text
    } finally {
      if (mounted) {
        setState(() {
          isCartLoading = false;
        });
      }
    }
  }

  String? role;

  Future<void> _fetchUserRole() async {
    DocumentSnapshot userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .get();

    setState(() {
      role = userData['role'];
    });
  }

  @override
  void initState() {
    checkDocumentExistence();
    _fetchUserRole();

    super.initState();
  }

  Future<void> checkOrderTime() async {
    int currentHourTime = DateTime.now().hour;

    // Fetch the 'time' document from Firestore
    DocumentSnapshot timeDoc = await FirebaseFirestore.instance
        .collection('Order Time')
        .doc('time')
        .get();

    if (timeDoc.exists) {
      Map<String, dynamic>? data = timeDoc.data() as Map<String, dynamic>?;
      if (data != null) {
        int startTime = data['start'];
        int endTime = data['end'];

        if (currentHourTime > startTime && currentHourTime < endTime) {
          // Current time is within the allowed order time
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ConfirmOrder(
                foodName: widget.foodName,
                foodPrice: int.parse(widget.foodPrice),
                image: widget.image,
              ),
            ),
          );
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(S.of(context).orderNotAllowed),
                content: Text(S.of(context).allowedTimeBetween(
                    startTime.toString(), endTime.toString())),
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
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        backgroundColor: AppColors.transparent,
        shadowColor: AppColors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Spacer(flex: 1),
            Text(
              S.of(context).foodDetails,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 1),
            const SizedBox(height: 10),
            MyShimmerImage(profileImageUrl: widget.image, size: 150),
            const SizedBox(height: 20),
            Text(
              widget.foodName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '${widget.foodPrice} \$',
              style: const TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const Spacer(flex: 4),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).returnPolicy,
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    S.of(context).returnPolicyMessage,
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 16,
                      color: Color.fromARGB(255, 143, 142, 142),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 4),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: isCartLoading ? null : toggleCart,
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                            const Color.fromARGB(255, 239, 48, 41),
                          ),
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                        child: isCartLoading
                            ? const SizedBox(
                                width: 22,
                                height: 22,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.5,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              )
                            : Text(
                                cartText,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  role == 'user'
                      ? Expanded(
                          child: SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () async {
                                await checkOrderTime();
                              },
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  const Color.fromARGB(255, 239, 48, 41),
                                ),
                                shape: WidgetStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                              ),
                              child: Text(
                                S.of(context).orderNow,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
