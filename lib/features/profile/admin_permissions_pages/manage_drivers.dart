import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fooddeliveryapp/features/profile/admin_permissions_pages/change_role.dart';
import 'package:fooddeliveryapp/features/profile/widgets/driver_data.dart';
import 'package:fooddeliveryapp/generated/l10n.dart';

class ManageDrivers extends StatefulWidget {
  const ManageDrivers({super.key});

  @override
  State<ManageDrivers> createState() => _ManageDriversState();
}

class _ManageDriversState extends State<ManageDrivers> {
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
              S.of(context).manageDriversTitle,
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
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                      color: AppColors.neutralButton));
            }

            if (snapshot.data!.docs.isEmpty) {
              return Center(
                child: Text(
                  S.of(context).noItemsFoundInCart,
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                  ),
                ),
              );
            }

            List drivers = snapshot.data!.docs
                .where((doc) => doc['role'] == 'driver')
                .toList();

            if (drivers.isEmpty) {
              return Center(
                child: Text(
                  S.of(context).noDriversAvailable,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              );
            } else {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/flick-to-left.png',
                        width: 18,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        S.of(context).swipeForMoreDetails,
                        style: TextStyle(fontFamily: 'Ubuntu'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Expanded(
                    child: ListView.builder(
                      itemCount: drivers.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(2),
                          child: Center(
                            child: Column(
                              children: [
                                Slidable(
                                  endActionPane: ActionPane(
                                    motion: const StretchMotion(),
                                    children: [
                                      SlidableAction(
                                        onPressed: (context) async {
                                          FirebaseFirestore.instance
                                              .collection('users')
                                              .doc(drivers[index]['email'])
                                              .update({'orders': 0});
                                        },
                                        backgroundColor: const Color.fromARGB(
                                            166, 54, 219, 13),
                                        icon: Icons.refresh_outlined,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      SlidableAction(
                                        onPressed: (context) async {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ChangeRole(
                                                  email: drivers[index]
                                                      ['email']),
                                            ),
                                          );
                                        },
                                        backgroundColor: const Color.fromARGB(
                                            166, 13, 143, 219),
                                        icon: Icons.manage_accounts_rounded,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ],
                                  ),
                                  child: DriverData(
                                      drivers: drivers, index: index),
                                ),
                                const SizedBox(height: 7),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
