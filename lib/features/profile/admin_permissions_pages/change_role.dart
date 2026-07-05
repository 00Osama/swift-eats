import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';
import 'package:fooddeliveryapp/core/widgets/MyTextfield.dart';
import 'package:fooddeliveryapp/core/helpers/error_message.dart';
import 'package:fooddeliveryapp/generated/l10n.dart';

class ChangeRole extends StatefulWidget {
  const ChangeRole({
    super.key,
    this.email,
  });
  final String? email;

  @override
  State<ChangeRole> createState() => _ChangeRoleState();
}

class _ChangeRoleState extends State<ChangeRole> {
  TextEditingController email = TextEditingController();
  TextEditingController price = TextEditingController();
  String? emailErrorText;
  String? priceErrorText;
  Future<DocumentSnapshot>? futureUserData;

  bool isValidEmail(String email) {
    String emailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regExp = RegExp(emailRegex);
    return regExp.hasMatch(email);
  }

  Future<bool> userExists(String email) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();
    return querySnapshot.docs.isNotEmpty;
  }

  String? dropDownValue;
  List<DropdownMenuItem<String>>? dropItems;

  @override
  void initState() {
    if (widget.email != null) {
      email.text = widget.email!;
    }
    super.initState();
  }

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
              S.of(context).changeRolesTitle,
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
      body: Center(
        child: ListView(
          children: [
            const SizedBox(height: 15),
            Center(
              child: Text(
                S.of(context).changeRolesHint,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            const SizedBox(height: 8),
            MyTextField(
              controller: email,
              hintText: S.of(context).email,
              obscureText: false,
              errorText: emailErrorText,
              readOnly: false,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 130),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all(AppColors.neutralButton),
                ),
                onPressed: () async {
                  if (email.text.isEmpty) {
                    setState(() {
                      emailErrorText = S.of(context).thisFieldIsRequired;
                    });
                  } else if (!isValidEmail(email.text)) {
                    setState(() {
                      emailErrorText = S.of(context).invalidEmailAddress;
                    });
                  } else if (await userExists(email.text) == false) {
                    setState(() {
                      emailErrorText = S.of(context).userNotFound;
                    });
                  } else {
                    setState(() {
                      emailErrorText = null;
                      futureUserData = FirebaseFirestore.instance
                          .collection('users')
                          .doc(email.text)
                          .get();
                    });
                  }
                },
                child: Text(
                  S.of(context).search,
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                    color: AppColors.neutralButtonText,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            FutureBuilder<DocumentSnapshot>(
              future: futureUserData,
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
                } else if (snapshot.hasData && snapshot.data != null) {
                  var data = snapshot.data!.data() as Map<String, dynamic>;
                  if (data['role'] == 'user') {
                    dropItems = [
                      DropdownMenuItem(
                        value: 'driver',
                        child: Text(
                          S.of(context).driverRole,
                          style: const TextStyle(fontFamily: 'Ubuntu'),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'admin',
                        child: Text(
                          S.of(context).adminRole,
                          style: const TextStyle(fontFamily: 'Ubuntu'),
                        ),
                      ),
                    ];
                  } else if (data['role'] == 'driver') {
                    dropItems = [
                      DropdownMenuItem(
                        value: 'user',
                        child: Text(
                          S.of(context).userRole,
                          style: const TextStyle(fontFamily: 'Ubuntu'),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'admin',
                        child: Text(
                          S.of(context).adminRole,
                          style: const TextStyle(fontFamily: 'Ubuntu'),
                        ),
                      ),
                    ];
                  } else {
                    dropItems = [
                      DropdownMenuItem(
                        value: 'user',
                        child: Text(
                          S.of(context).userRole,
                          style: const TextStyle(fontFamily: 'Ubuntu'),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'driver',
                        child: Text(
                          S.of(context).driverRole,
                          style: const TextStyle(fontFamily: 'Ubuntu'),
                        ),
                      ),
                    ];
                  }
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        color: AppColors.skeletonHighlight,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            S.of(context).nameLabel(data['FullName']),
                            style: const TextStyle(
                              fontSize: 15,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.bold,
                              color: AppColors.black,
                            ),
                          ),
                          Text(
                            S.of(context).currentRoleLabel(data['role']),
                            style: const TextStyle(
                              fontSize: 15,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.bold,
                              color: AppColors.black,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                S.of(context).chooseNewRoleHere,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Ubuntu',
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Container(
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
                                    value: dropDownValue,
                                    items: dropItems,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropDownValue = newValue!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          MyTextField(
                            controller: price,
                            hintText: S.of(context).pricePerOrderWhenDriver,
                            obscureText: false,
                            errorText: priceErrorText,
                            readOnly: false,
                            inputType: TextInputType.number,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (dropDownValue == null) {
                                message(
                                  context,
                                  title: S.of(context).error,
                                  content: S.of(context).pleaseSelectRole,
                                  buttonText: S.of(context).ok,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                );
                              } else if (dropDownValue == 'driver' &&
                                  price.text.isEmpty) {
                                setState(() {
                                  priceErrorText =
                                      S.of(context).requiredWhenDriver;
                                });
                              } else if (dropDownValue == 'driver' &&
                                  int.tryParse(price.text) == null) {
                                setState(() {
                                  priceErrorText = S.of(context).invalidNumber;
                                });
                              } else {
                                try {
                                  Map<String, dynamic> updates = {
                                    'role': dropDownValue!,
                                  };

                                  if (dropDownValue == 'driver') {
                                    updates['salaryPerOrder'] =
                                        int.parse(price.text);
                                  }

                                  FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(email.text)
                                      .update(updates);

                                  message(
                                    context,
                                    title: S.of(context).success,
                                    content: S
                                        .of(context)
                                        .changesSaved(dropDownValue!),
                                    buttonText: S.of(context).done,
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    },
                                  );
                                } catch (e) {
                                  message(
                                    context,
                                    title: S.of(context).error,
                                    content: e.toString(),
                                    buttonText: S.of(context).done,
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    },
                                  );
                                }
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                  AppColors.neutralButton),
                            ),
                            child: Text(
                              S.of(context).saveChanges,
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Ubuntu',
                                fontWeight: FontWeight.bold,
                                color: AppColors.neutralButtonText,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        color: AppColors.skeletonHighlight,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
