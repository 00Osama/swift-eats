import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/generated/l10n.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';
import 'package:fooddeliveryapp/core/widgets/MyButton.dart';
import 'package:fooddeliveryapp/core/helpers/error_message.dart';
import 'package:fooddeliveryapp/features/auth/widgets/auth_gate.dart';
import 'package:fooddeliveryapp/features/auth/widgets/auth_service.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:fooddeliveryapp/global_fields.dart';

class ChooseProfilePhoto extends StatefulWidget {
  const ChooseProfilePhoto({super.key});

  @override
  State<ChooseProfilePhoto> createState() => _ChooseProfilePhotoState();
}

class _ChooseProfilePhotoState extends State<ChooseProfilePhoto> {
  final ImagePicker picker = ImagePicker();
  Widget pickedImage = Image.asset(
    'assets/images/defult person.jpg',
  );
  bool isImagePicked = false;
  String? emailErrorText;

  imgFromGallery() async {
    await picker
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage(File(value.path));
      }
    });
  }

  imgFromCamera() async {
    await picker
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage(File(value.path));
      }
    });
  }

  void showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Card(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5.2,
            margin: const EdgeInsets.only(top: 8.0),
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    child: Column(
                      children: [
                        Icon(Icons.image, size: 60.0),
                        SizedBox(height: 12.0),
                        Text(
                          S.of(context).gallery,
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 16, color: AppColors.black),
                        ),
                      ],
                    ),
                    onTap: () {
                      imgFromGallery();
                      Navigator.pop(context);
                    },
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Column(
                      children: [
                        Icon(Icons.camera_alt, size: 60.0),
                        SizedBox(height: 12.0),
                        Text(
                          S.of(context).camera,
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 16, color: AppColors.black),
                        ),
                      ],
                    ),
                    onTap: () {
                      imgFromCamera();
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _cropImage(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: S.of(context).imageCropper,
              toolbarColor: AppColors.cropToolbar,
              toolbarWidgetColor: AppColors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: S.of(context).imageCropper,
          )
        ]);
    if (croppedFile != null) {
      imageCache.clear();
      setState(() {
        imageFile = File(croppedFile.path);
        pickedImage = Image.file(
          imageFile!,
          fit: BoxFit.cover,
        );
        isImagePicked = true;
      });
      // reload();
    }
  }

  void _showPermissionDeniedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).permissionDenied),
          content: Text(S.of(context).permissionDeniedMessage),
          actions: [
            TextButton(
              child: Text(S.of(context).settings),
              onPressed: () {
                openAppSettings();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(S.of(context).cancel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  File? imageFile;
  String? imagePath;
  String? imageUrl;

  Future<void> uploadImage(BuildContext context) async {
    if (imageFile == null) {
      imageUrl = 'defaultImage';
      imagePath = null;
      return;
    }

    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      String fileName = imageFile!.path.split('/').last;
      Reference ref = storage.ref().child('profile/$fileName');
      UploadTask uploadTask = ref.putFile(imageFile!);

      imageUrl = await (await uploadTask).ref.getDownloadURL();
      imagePath = ref.fullPath;
    } catch (e) {
      message(
        context,
        title: S.of(context).error,
        content: e.toString(),
        buttonText: S.of(context).failedToUploadImage,
        onPressed: () {
          Navigator.pop(context);
        },
      );
    }
  }

  final auth = AuthService();

  void signUP() async {
    try {
      await auth.signUp(
        emailController.text.trim(),
        passwordController.text.trim(),
        fullNameController.text.trim(),
        phoneNumberController.text.trim(),
        imageUrl!,
      );
      emailController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
      fullNameController.clear();
      phoneNumberController.clear();

      Navigator.pop(context);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => AuthGate()),
        (route) => false,
      );
    } catch (e) {
      Navigator.pop(context);
      message(
        context,
        title: S.of(context).error,
        content: e.toString(),
        buttonText: S.of(context).ok,
        onPressed: () {
          Navigator.pop(context);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).chooseProfilePhotoTitle,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            SizedBox(height: 4),
            Text(
              S.of(context).chooseProfilePhotoSubtitle,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            SizedBox(height: 30),
            Column(
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10000),
                    child: pickedImage,
                  ),
                ),
                if (isImagePicked) ...[
                  SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        imageFile = null;
                        imagePath = null;
                        imageUrl = null;
                        isImagePicked = false;
                        pickedImage = Image.asset(
                          'assets/images/defult person.jpg',
                        );
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.danger,
                          width: 1.5,
                        ),
                      ),
                      child: const Icon(
                        Icons.delete_rounded,
                        color: AppColors.danger,
                      ),
                    ),
                  ),
                ],
              ],
            ),
            SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: MyButton(
                    color: AppColors.primary,
                    text: S.of(context).choosePhoto,
                    onPressed: () async {
                      Map<Permission, PermissionStatus> statuses = await [
                        Permission.storage,
                        Permission.camera
                      ].request();
                      if (statuses[Permission.storage]!.isGranted &&
                          statuses[Permission.camera]!.isGranted) {
                        showImagePicker(context);
                      } else {
                        _showPermissionDeniedDialog(context);
                      }
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: MyButton(
                    color: AppColors.primary,
                    text: S.of(context).continueToSignUp,
                    onPressed: () async {
                      showDialog(
                        context: context,
                        builder: (context) => const Center(
                          child:
                              CircularProgressIndicator(color: AppColors.black),
                        ),
                      );
                      await uploadImage(context);
                      signUP();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
