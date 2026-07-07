import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';
import 'package:fooddeliveryapp/core/widgets/MyTextfield.dart';
import 'package:fooddeliveryapp/core/widgets/my_shimmer_image.dart';
import 'package:fooddeliveryapp/generated/l10n.dart';
import 'package:fooddeliveryapp/global_fields.dart';

class OrderItem extends StatefulWidget {
  const OrderItem({
    super.key,
    required this.address,
    required this.image,
    required this.name,
    required this.order,
    required this.phoneNumber,
    required this.quantity,
    required this.totalPrice,
    this.securityCode,
    this.orderId,
    this.email,
    required this.role,
    this.btnOkOnPress,
  });

  final String image;
  final String order;
  final int quantity;
  final int totalPrice;
  final String name;
  final String phoneNumber;
  final String address;
  final String? securityCode;
  final String? orderId;
  final String? email;
  final String role;
  final void Function()? btnOkOnPress;

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: IntrinsicHeight(
        child: Container(
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
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 6),
                Text(
                  S.of(context).orderDetails,
                  style: const TextStyle(
                    fontSize: 15,
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 134, 110, 148),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    MyShimmerImage(profileImageUrl: widget.image, size: 75),
                    const SizedBox(width: 5),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              S.of(context).orderLabel(widget.order),
                              style: const TextStyle(
                                fontFamily: 'Ubuntu',
                                fontSize: 17,
                                color: Color.fromARGB(255, 24, 11, 11),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            child: Text(
                              S.of(context).quantityLabel(widget.quantity),
                              style: const TextStyle(
                                fontFamily: 'Ubuntu',
                                fontSize: 17,
                                color: Color.fromARGB(255, 24, 11, 11),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            child: Text(
                              S.of(context).totalPriceLabel(widget.totalPrice),
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
                  ],
                ),
                const SizedBox(height: 15),
                Text(
                  S.of(context).customerInfo,
                  style: const TextStyle(
                    fontSize: 15,
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 134, 110, 148),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.person_rounded),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        widget.name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.phone_rounded),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        widget.phoneNumber,
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.location_on_rounded),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        widget.address,
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                widget.role == 'user'
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).securityCode,
                            style: const TextStyle(
                              fontSize: 15,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 134, 110, 148),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            widget.securityCode!,
                            style: const TextStyle(
                              fontSize: 15,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.bold,
                              color: AppColors.black,
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      )
                    : const SizedBox(),
                widget.role == 'driver'
                    ? Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 40,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(
                                        AppColors.textPrimary,
                                      ),
                                    ),
                                    onPressed: () {
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.warning,
                                        animType: AnimType.rightSlide,
                                        showCloseIcon: true,
                                        btnOkText: S.of(context).confirm,
                                        btnOkColor: AppColors.textPrimary,
                                        btnOkOnPress: widget.btnOkOnPress,
                                        body: Column(
                                          children: [
                                            Text(
                                              S.of(context).enterSecurityCode,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Ubuntu',
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.black,
                                              ),
                                            ),
                                            MyTextField(
                                              readOnly: false,
                                              controller: code,
                                              hintText: S
                                                  .of(context)
                                                  .orderSecurityCode,
                                              obscureText: false,
                                              errorText: codeErrorText,
                                              inputType: TextInputType.number,
                                            ),
                                          ],
                                        ),
                                      ).show();
                                    },
                                    child: Text(
                                      S.of(context).confirmOrder,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Ubuntu',
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.neutralButtonText,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                        ],
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
