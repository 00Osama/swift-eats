import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/generated/l10n.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';
import 'package:fooddeliveryapp/core/widgets/MyTextfield.dart';
import 'package:fooddeliveryapp/core/helpers/error_message.dart';

class EditOrderTime extends StatefulWidget {
  const EditOrderTime({super.key});

  @override
  State<EditOrderTime> createState() => _EditOrderTimeState();
}

class _EditOrderTimeState extends State<EditOrderTime> {
  TextEditingController start = TextEditingController();
  TextEditingController end = TextEditingController();
  String? startTimeValue;
  String? endTimeValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
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
              S.of(context).editOrderTimeTitle,
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
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('Order Time')
            .doc('time')
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.neutralButton,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (!snapshot.hasData || snapshot.data!.data() == null) {
            return Center(
              child: Text('No data available'),
            );
          }

          var data = snapshot.data!.data();
          start.text = data!['start'].toString();
          end.text = data['end'].toString();
          return Column(
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          S.of(context).currentStartTime,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Ubuntu',
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        MyTextField(
                          controller: start,
                          hintText: S.of(context).startTimeHint,
                          obscureText: false,
                          errorText: null,
                          readOnly: true,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          S.of(context).currentEndTime,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Ubuntu',
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        MyTextField(
                          controller: end,
                          hintText: S.of(context).endTimeHint,
                          obscureText: false,
                          errorText: null,
                          readOnly: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          color: AppColors.skeletonDark,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: DropdownButton(
                          dropdownColor: AppColors.white,
                          iconEnabledColor: AppColors.dropdownIcon,
                          iconDisabledColor: AppColors.muted,
                          icon: const Icon(Icons.menu_rounded),
                          style: const TextStyle(
                            color: AppColors.black,
                            fontFamily: 'Ubuntu',
                          ),
                          focusColor: AppColors.dropdownFocus,
                          value: startTimeValue,
                          items: const [
                            DropdownMenuItem(
                              value: '1',
                              child: Text(
                                '1',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '2',
                              child: Text(
                                '2',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '3',
                              child: Text(
                                '3',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '4',
                              child: Text(
                                '4',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '5',
                              child: Text(
                                '5',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '6',
                              child: Text(
                                '6',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '7',
                              child: Text(
                                '7',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '8',
                              child: Text(
                                '8',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '9',
                              child: Text(
                                '9',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '10',
                              child: Text(
                                '10',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '11',
                              child: Text(
                                '11',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '12',
                              child: Text(
                                '12',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '13',
                              child: Text(
                                '13',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '14',
                              child: Text(
                                '14',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '15',
                              child: Text(
                                '15',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '16',
                              child: Text(
                                '16',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '17',
                              child: Text(
                                '17',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '18',
                              child: Text(
                                '18',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '19',
                              child: Text(
                                '19',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '20',
                              child: Text(
                                '20',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '21',
                              child: Text(
                                '21',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '22',
                              child: Text(
                                '22',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '23',
                              child: Text(
                                '23',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '24',
                              child: Text(
                                '24',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                          ],
                          onChanged: (String? newValue) {
                            setState(() {
                              startTimeValue = newValue!;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        S.of(context).newStartTime,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          color: AppColors.skeletonDark,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: DropdownButton(
                          dropdownColor: AppColors.white,
                          iconEnabledColor: AppColors.dropdownIcon,
                          iconDisabledColor: AppColors.muted,
                          icon: const Icon(Icons.menu_rounded),
                          style: const TextStyle(
                            color: AppColors.black,
                            fontFamily: 'Ubuntu',
                          ),
                          focusColor: AppColors.dropdownFocus,
                          value: endTimeValue,
                          items: const [
                            DropdownMenuItem(
                              value: '1',
                              child: Text(
                                '1',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '2',
                              child: Text(
                                '2',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '3',
                              child: Text(
                                '3',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '4',
                              child: Text(
                                '4',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '5',
                              child: Text(
                                '5',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '6',
                              child: Text(
                                '6',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '7',
                              child: Text(
                                '7',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '8',
                              child: Text(
                                '8',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '9',
                              child: Text(
                                '9',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '10',
                              child: Text(
                                '10',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '11',
                              child: Text(
                                '11',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '12',
                              child: Text(
                                '12',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '13',
                              child: Text(
                                '13',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '14',
                              child: Text(
                                '14',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '15',
                              child: Text(
                                '15',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '16',
                              child: Text(
                                '16',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '17',
                              child: Text(
                                '17',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '18',
                              child: Text(
                                '18',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '19',
                              child: Text(
                                '19',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '20',
                              child: Text(
                                '20',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '21',
                              child: Text(
                                '21',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '22',
                              child: Text(
                                '22',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '23',
                              child: Text(
                                '23',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '24',
                              child: Text(
                                '24',
                                style: TextStyle(fontFamily: 'Ubuntu'),
                              ),
                            ),
                          ],
                          onChanged: (String? newValue) {
                            setState(() {
                              endTimeValue = newValue!;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        S.of(context).newEndTime,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(AppColors.neutralButton)),
                onPressed: () {
                  try {
                    int start = int.parse(startTimeValue!);
                    int end = int.parse(endTimeValue!);
                    FirebaseFirestore.instance
                        .collection('Order Time')
                        .doc('time')
                        .update({
                      'start': start,
                      'end': end,
                    });
                    message(
                      context,
                      title: S.of(context).success,
                      content: S.of(context).updatingTimeDone,
                      buttonText: S.of(context).ok,
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                    );
                  } catch (e) {
                    message(
                      context,
                      title: S.of(context).error,
                      content: S.of(context).errorUpdatingTime,
                      buttonText: S.of(context).ok,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    );
                  }
                },
                child: Text(
                  S.of(context).updateTime,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                    color: AppColors.neutralButtonText,
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
