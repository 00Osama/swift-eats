import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/generated/l10n.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';
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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
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
          return Column(children: [
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).currentStartTime,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Ubuntu',
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        width: 170,
                        height: 56,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: Colors.grey.shade300,
                          ),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                start.text,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Ubuntu',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).currentEndTime,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Ubuntu',
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        width: 170,
                        height: 56,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: Colors.grey.shade300,
                          ),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                end.text,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Ubuntu',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).newStartTime,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Ubuntu',
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        const SizedBox(height: 6),
                        DropdownMenu<String>(
                          width: 170,
                          initialSelection: startTimeValue,
                          hintText: S.of(context).startTimeHint,
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'Ubuntu',
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                          inputDecorationTheme: InputDecorationTheme(
                            filled: true,
                            fillColor: Theme.of(context).colorScheme.surface,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 2,
                              ),
                            ),
                          ),
                          trailingIcon:
                              const Icon(Icons.keyboard_arrow_down_rounded),
                          selectedTrailingIcon:
                              const Icon(Icons.keyboard_arrow_up_rounded),
                          menuHeight: 250,
                          dropdownMenuEntries: List.generate(
                            24,
                            (index) => DropdownMenuEntry<String>(
                              value: '${index + 1}',
                              label: '${index + 1}',
                            ),
                          ),
                          onSelected: (value) {
                            setState(() {
                              startTimeValue = value;
                            });
                          },
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).newEndTime,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Ubuntu',
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        const SizedBox(height: 6),
                        DropdownMenu<String>(
                          width: 170,
                          initialSelection: endTimeValue,
                          hintText: S.of(context).endTimeHint,
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'Ubuntu',
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                          inputDecorationTheme: InputDecorationTheme(
                            filled: true,
                            fillColor: Theme.of(context).colorScheme.surface,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 2,
                              ),
                            ),
                          ),
                          trailingIcon:
                              const Icon(Icons.keyboard_arrow_down_rounded),
                          selectedTrailingIcon:
                              const Icon(Icons.keyboard_arrow_up_rounded),
                          menuHeight: 250,
                          dropdownMenuEntries: List.generate(
                            24,
                            (index) => DropdownMenuEntry<String>(
                              value: '${index + 1}',
                              label: '${index + 1}',
                            ),
                          ),
                          onSelected: (value) {
                            setState(() {
                              endTimeValue = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                FractionallySizedBox(
                  widthFactor: 0.80,
                  child: ElevatedButton(
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
                  ),
                )
              ],
            )
          ]);
        },
      ),
    );
  }
}
