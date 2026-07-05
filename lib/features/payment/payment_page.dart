import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';
import 'package:fooddeliveryapp/generated/l10n.dart';
import 'package:fooddeliveryapp/core/widgets/MyButton.dart';
import 'package:fooddeliveryapp/core/widgets/MyDivider.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    int totalPrice = 0;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/images/back-icon.png',
                      width: 22,
                    ),
                  ),
                ),
                const SizedBox(width: 100),
                Text(
                  S.of(context).checkout,
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.only(right: 189),
              child: Text(
                S.of(context).payment,
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 33,
                ),
              ),
            ),
            const SizedBox(height: 45),
            Padding(
              padding: EdgeInsets.only(right: 172),
              child: Text(
                S.of(context).paymentMethod,
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 19,
                ),
              ),
            ),
            const SizedBox(height: 17),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 170,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.muted,
                      blurRadius: 9.0,
                      spreadRadius: 1.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: 'Card',
                          groupValue: 'yes',
                          onChanged: (value) {},
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.paymentOrange,
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Image.asset(
                              'assets/images/credit-card.png',
                            ),
                          ),
                        ),
                        Text(
                          '  ${S.of(context).card}',
                          style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 19,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: MyDivider(dividerHeight: 1, verticalSpace: 0),
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'Bank Account',
                          groupValue: 'yes',
                          onChanged: (value) {},
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.paymentPink,
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Image.asset(
                              'assets/images/bank.png',
                            ),
                          ),
                        ),
                        Text(
                          '  ${S.of(context).bankAccount}',
                          style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 19,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 45),
            Padding(
              padding: EdgeInsets.only(right: 172),
              child: Text(
                S.of(context).deliveryMethod,
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 19,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 170,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.muted,
                      blurRadius: 9.0,
                      spreadRadius: 1.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: 'Pick UP',
                          groupValue: 'yes',
                          onChanged: (value) {},
                        ),
                        Text(
                          '  ${S.of(context).pickUp}',
                          style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 19,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: MyDivider(dividerHeight: 1, verticalSpace: 0),
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'Door Delivery',
                          groupValue: 'yes',
                          onChanged: (value) {},
                        ),
                        Text(
                          '  ${S.of(context).doorDelivery}',
                          style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 19,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 56),
            Padding(
              padding: const EdgeInsets.only(left: 22),
              child: Row(
                children: [
                  Text(
                    S.of(context).totalPrice,
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '$totalPrice \$',
                    style: const TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 600,
              child: MyButton(
                color: AppColors.primary,
                text: S.of(context).proceedToPayment,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
