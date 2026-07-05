import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/generated/l10n.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fooddeliveryapp/core/widgets/MyTextfield.dart';
import 'package:fooddeliveryapp/features/auth/widgets/auth_service.dart';
import 'package:shimmer/shimmer.dart';

class AccountInfo extends StatefulWidget {
  const AccountInfo({Key? key}) : super(key: key);

  @override
  State<AccountInfo> createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

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
        title: Text(
          S().accountInfo,
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Ubuntu',
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('users')
                  .doc(FirebaseAuth.instance.currentUser!.email)
                  .get(),
              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Column(
                    children: [
                      Shimmer.fromColors(
                        baseColor: AppColors.skeletonDark,
                        highlightColor: AppColors.white,
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Shimmer.fromColors(
                        baseColor: AppColors.skeletonDark,
                        highlightColor: AppColors.white,
                        child: Container(
                          height: 20,
                          width: 150,
                          color: AppColors.skeletonBase,
                        ),
                      ),
                      const SizedBox(height: 60),
                      Shimmer.fromColors(
                        baseColor: AppColors.skeletonDark,
                        highlightColor: AppColors.white,
                        child: Container(
                          height: 20,
                          width: 150,
                          color: AppColors.skeletonBase,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Shimmer.fromColors(
                        baseColor: AppColors.skeletonDark,
                        highlightColor: AppColors.white,
                        child: Container(
                          height: 20,
                          width: 150,
                          color: AppColors.skeletonBase,
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }

                if (!snapshot.hasData || snapshot.data!.data() == null) {
                  return Center(
                    child: Text(S.of(context).accountInfoNoData),
                  );
                }

                var userData = snapshot.data!.data() as Map<String, dynamic>;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(75),
                        child: FancyShimmerImage(
                          imageUrl: userData['profileImage'],
                          shimmerBaseColor: AppColors.skeletonBase,
                          shimmerHighlightColor: AppColors.white,
                          boxFit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      userData['FullName'] ?? S.of(context).fullName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 63, 72, 87),
                      ),
                    ),
                    const SizedBox(height: 60),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: MyTextField(
                        readOnly: true,
                        controller: TextEditingController(
                          text: userData['email'],
                        ),
                        hintText: S.of(context).email,
                        obscureText: false,
                        errorText: null,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: MyTextField(
                        readOnly: true,
                        controller: TextEditingController(
                          text: userData['phoneNumber'],
                        ),
                        hintText: S.of(context).phoneNumber,
                        obscureText: false,
                        errorText: null,
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor:
                    WidgetStatePropertyAll(Color.fromARGB(178, 244, 67, 54)),
              ),
              onPressed: () {
                AuthService().signOut();
                Navigator.pop(context);
              },
              child: Text(
                S.of(context).accountInfoSignOut,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Ubuntu',
                  color: AppColors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
