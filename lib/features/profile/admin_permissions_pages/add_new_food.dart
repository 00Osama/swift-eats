import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/generated/l10n.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';
import 'package:fooddeliveryapp/core/widgets/MyTextfield.dart';
import 'package:fooddeliveryapp/core/helpers/error_message.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class AddNewFood extends StatefulWidget {
  const AddNewFood({
    super.key,
  });

  @override
  State<AddNewFood> createState() => _AddNewFoodState();
}

class _AddNewFoodState extends State<AddNewFood> {
  String dropDownValue = 'Foods    ';
  final ImagePicker picker = ImagePicker();
  File? imageFile;
  bool isImagePicked = false;
  String? imageUrl;
  String? imagePath;

  TextEditingController foodName = TextEditingController();
  String? foodNameErrorText;

  TextEditingController foodPrice = TextEditingController();
  String? foodPriceErrorText;

  Widget pickedImage = Image.asset(
    'assets/images/defult food.png',
  );

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
            title: "Image Cropper",
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
          title: Text("Permission Denied"),
          content:
              Text("Please allow permissions in the app settings to continue."),
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

  Future<void> uploadImage(context) async {
    if (imageFile != null) {
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
  }

  Future<void> uploadFood(context) async {
    await uploadImage(context);
    try {
      await FirebaseFirestore.instance.collection(dropDownValue).add({
        'timeStamp': Timestamp.now(),
        'foodName': foodName.text,
        'foodImage': imageUrl,
        'ImagePath': imagePath,
        'foodPrice': foodPrice.text,
      });
    } catch (e) {
      message(
        context,
        title: S.of(context).error,
        content: 'failed to add food, please try again',
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
              S.of(context).addNewFood,
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
            Center(
              child: Text(
                S.of(context).chooseFoodCategory,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
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
                  items: const [
                    DropdownMenuItem(
                      value: 'Foods    ',
                      child: Text(
                        'Foods    ',
                        style: TextStyle(fontFamily: 'Ubuntu'),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'Drinks    ',
                      child: Text(
                        'Drinks    ',
                        style: TextStyle(fontFamily: 'Ubuntu'),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'Snacks    ',
                      child: Text(
                        'Snacks    ',
                        style: TextStyle(fontFamily: 'Ubuntu'),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'Desserts    ',
                      child: Text(
                        'Desserts    ',
                        style: TextStyle(fontFamily: 'Ubuntu'),
                      ),
                    ),
                  ],
                  onChanged: (String? newValue) {
                    setState(() {
                      dropDownValue = newValue!;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: Text(
                S.of(context).chooseFoodName,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            const SizedBox(height: 7),
            MyTextField(
              readOnly: false,
              controller: foodName,
              hintText: S.of(context).foodNameHint,
              obscureText: false,
              errorText: foodNameErrorText,
            ),
            const SizedBox(height: 40),
            Center(
              child: Text(
                S.of(context).chooseFoodPrice,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            const SizedBox(height: 7),
            MyTextField(
              readOnly: false,
              controller: foodPrice,
              hintText: S.of(context).foodPriceHint,
              obscureText: false,
              errorText: foodPriceErrorText,
              inputType: TextInputType.number,
            ),
            const SizedBox(height: 40),
            Center(
              child: Text(
                S.of(context).chooseFoodImage,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            const SizedBox(height: 10),
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
              ],
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 95),
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    AppColors.chooseImageButton,
                  ),
                ),
                onPressed: () async {
                  Map<Permission, PermissionStatus> statuses =
                      await [Permission.storage, Permission.camera].request();
                  if (statuses[Permission.storage]!.isGranted &&
                      statuses[Permission.camera]!.isGranted) {
                    showImagePicker(context);
                  } else {
                    _showPermissionDeniedDialog(context);
                  }
                  setState(() {});
                },
                child: Text(
                  S.of(context).chooseImageButton,
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    AppColors.confirmButton,
                  ),
                ),
                onPressed: () async {
                  if (foodName.text.isEmpty) {
                    setState(() {
                      foodNameErrorText = S.of(context).thisFieldIsRequired;
                    });
                  } else {
                    setState(() {
                      foodNameErrorText = null;
                    });
                  }

                  if (foodPrice.text.isEmpty) {
                    setState(() {
                      foodPriceErrorText = S.of(context).thisFieldIsRequired;
                    });
                  } else {
                    setState(() {
                      foodPriceErrorText = null;
                    });
                  }

                  if (foodNameErrorText == null &&
                      foodPriceErrorText == null &&
                      !isImagePicked) {
                    message(
                      context,
                      title: S.of(context).error,
                      content: S.of(context).pleaseChooseFoodImage,
                      buttonText: S.of(context).ok,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    );
                  }

                  if (foodNameErrorText == null &&
                      foodPriceErrorText == null &&
                      isImagePicked) {
                    showDialog(
                      context: context,
                      builder: (context) => const Center(
                        child:
                            CircularProgressIndicator(color: AppColors.black),
                      ),
                    );
                    await uploadFood(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  S.of(context).addFoodButton,
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
