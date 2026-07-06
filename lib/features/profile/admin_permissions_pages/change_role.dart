import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/core/helpers/error_message.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';
import 'package:fooddeliveryapp/core/widgets/MyTextfield.dart';
import 'package:fooddeliveryapp/features/profile/widgets/role_chip.dart';
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

  String getRoleName(BuildContext context, String role) {
    switch (role.toLowerCase()) {
      case 'admin':
        return S.of(context).adminRole;
      case 'driver':
        return S.of(context).driverRole;
      case 'user':
        return S.of(context).userRole;
      default:
        return role;
    }
  }

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
            MyTextField(
              controller: email,
              hintText: S.of(context).email,
              obscureText: false,
              errorText: emailErrorText,
              readOnly: false,
            ),
            const SizedBox(height: 25),
            FractionallySizedBox(
              widthFactor: 0.80,
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
                  return Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.05),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: Text(
                            data['FullName'],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Ubuntu',
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: RoleChip(
                            role: data['role'],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          S.of(context).chooseNewRoleHere,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Ubuntu',
                          ),
                        ),
                        const SizedBox(height: 10),
                        DropdownMenu<String>(
                          width: double.infinity,
                          initialSelection: dropDownValue,
                          hintText: S.of(context).chooseNewRoleHere,
                          trailingIcon:
                              const Icon(Icons.keyboard_arrow_down_rounded),
                          selectedTrailingIcon:
                              const Icon(Icons.keyboard_arrow_up_rounded),
                          dropdownMenuEntries: dropItems!
                              .map(
                                (item) => DropdownMenuEntry(
                                  value: item.value!,
                                  label: (item.child as Text).data ?? '',
                                ),
                              )
                              .toList(),
                          onSelected: (value) {
                            setState(() {
                              dropDownValue = value;
                            });
                          },
                        ),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 250),
                          child: dropDownValue == 'driver'
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 18),
                                  child: MyTextField(
                                    controller: price,
                                    hintText:
                                        S.of(context).pricePerOrderWhenDriver,
                                    obscureText: false,
                                    errorText: priceErrorText,
                                    readOnly: false,
                                    inputType: TextInputType.number,
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          height: 52,
                          child: ElevatedButton.icon(
                            label: Text(
                              S.of(context).saveChanges,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Ubuntu',
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.neutralButton,
                              foregroundColor: AppColors.neutralButtonText,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
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
                                      S.of(context).thisFieldIsRequired;
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
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      height: 290,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      child: Center(
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green.withValues(alpha: .12),
                          ),
                          child: Icon(
                            Icons.manage_accounts_rounded,
                            size: 42,
                            color: Colors.green,
                          ),
                        ),
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
