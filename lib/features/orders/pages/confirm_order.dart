import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/core/widgets/my_shimmer_image.dart';
import 'package:fooddeliveryapp/generated/l10n.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';
import 'package:fooddeliveryapp/core/widgets/MyTextfield.dart';
import 'package:fooddeliveryapp/core/helpers/error_message.dart';

// ignore: must_be_immutable
class ConfirmOrder extends StatefulWidget {
  ConfirmOrder({
    super.key,
    this.amount = 1,
    required this.foodName,
    required this.foodPrice,
    required this.image,
  });

  int? amount;
  final String image;
  final String foodName;
  final int foodPrice;

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController address = TextEditingController();
  String? nameErrorText;
  String? phoneNumberErrorText;
  String? addressErrorText;

  @override
  void dispose() {
    name.dispose();
    phoneNumber.dispose();
    address.dispose();
    super.dispose();
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
        title: Text(
          S.of(context).confirmOrder,
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Ubuntu',
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: MyShimmerImage(
                      profileImageUrl: widget.image,
                      size: 90,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    children: [
                      Text(
                        widget.foodName.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        S
                            .of(context)
                            .totalPriceLabel(widget.foodPrice * widget.amount!),
                        style: const TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                S.of(context).quantityLabel(widget.amount!),
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (widget.amount! > 1) {
                        setState(() {
                          widget.amount = widget.amount! - 1;
                        });
                      }
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        color: AppColors.danger,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/minus.png',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    widget.amount.toString(),
                    style: const TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.amount = widget.amount! + 1;
                      });
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        color: AppColors.danger,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              MyTextField(
                readOnly: false,
                controller: name,
                hintText: S.of(context).name,
                obscureText: false,
                errorText: nameErrorText,
              ),
              const SizedBox(height: 8),
              MyTextField(
                readOnly: false,
                controller: phoneNumber,
                hintText: S.of(context).phoneNumber,
                obscureText: false,
                errorText: phoneNumberErrorText,
                inputType: TextInputType.number,
              ),
              const SizedBox(height: 8),
              MyTextField(
                readOnly: false,
                controller: address,
                hintText: S.of(context).address,
                obscureText: false,
                errorText: addressErrorText,
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        height: 39,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (name.text.isEmpty) {
                              nameErrorText = S.of(context).thisFieldIsRequired;
                            }
                            if (phoneNumber.text.isEmpty) {
                              phoneNumberErrorText =
                                  S.of(context).thisFieldIsRequired;
                            }
                            if (address.text.isEmpty) {
                              addressErrorText =
                                  S.of(context).thisFieldIsRequired;
                            }
                            setState(() {});
                            if (name.text.isNotEmpty &&
                                phoneNumber.text.isNotEmpty &&
                                address.text.isNotEmpty) {
                              try {
                                int foodTotalPrice =
                                    widget.foodPrice * widget.amount!;
                                int amount = widget.amount!;
                                Random random = Random();
                                int securityCode = 100 + random.nextInt(900);
                                await FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(FirebaseAuth
                                        .instance.currentUser!.email)
                                    .collection('orders')
                                    .add({
                                  'foodName': widget.foodName,
                                  'foodTotalPrice': foodTotalPrice,
                                  'foodImage': widget.image,
                                  'name': name.text,
                                  'phoneNumber': phoneNumber.text,
                                  'address': address.text,
                                  'quantity': amount,
                                  'timeStamp': Timestamp.now(),
                                  'securityKey': securityCode.toString(),
                                  'email':
                                      FirebaseAuth.instance.currentUser!.email,
                                });
                                Navigator.pop(context);
                              } catch (e) {
                                message(context,
                                    title: S.of(context).error,
                                    content:
                                        S.of(context).failedToCompleteOrder,
                                    buttonText: S.of(context).ok,
                                    onPressed: () {
                                  Navigator.pop(context);
                                });
                              }
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color>(
                              const Color.fromARGB(255, 45, 145, 25),
                            ),
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                          child: Text(
                            S.of(context).orderNowButton,
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        height: 39,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            widget.amount = 1;
                          },
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
                          child: Text(
                            S.of(context).cancel,
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
