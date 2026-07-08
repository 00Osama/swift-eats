// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(start, end) => "Allowed time is between ${start} and ${end}";

  static String m1(role) => "Changes saved for ${role}";

  static String m2(role) => "${role}";

  static String m3(foodName) => "Do You Want To Delete ${foodName} ?!";

  static String m4(name) => "${name}";

  static String m5(order) => "order : ${order}";

  static String m6(error) => "Error: ${error}";

  static String m7(quantity) => "quantity : ${quantity}";

  static String m8(seconds) => "Re-send in ${seconds} seconds";

  static String m9(totalPrice) => "total price : ${totalPrice}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accountInfo": MessageLookupByLibrary.simpleMessage("Account Info"),
        "accountInfoNoData":
            MessageLookupByLibrary.simpleMessage("No data available"),
        "accountInfoSignOut": MessageLookupByLibrary.simpleMessage("Sign Out"),
        "addFoodButton": MessageLookupByLibrary.simpleMessage("ADD FOOD"),
        "addNewFood": MessageLookupByLibrary.simpleMessage("Add New Food"),
        "addToCart": MessageLookupByLibrary.simpleMessage("Add to Cart"),
        "address": MessageLookupByLibrary.simpleMessage("Address"),
        "adminRole": MessageLookupByLibrary.simpleMessage("admin"),
        "allAvailableFoods":
            MessageLookupByLibrary.simpleMessage("All Available Foods"),
        "allowedTimeBetween": m0,
        "authSignIn": MessageLookupByLibrary.simpleMessage("Sign In"),
        "authSignUp": MessageLookupByLibrary.simpleMessage("Sign Up"),
        "bankAccount": MessageLookupByLibrary.simpleMessage("Bank Account"),
        "bottomNavSkeletonSubtitle":
            MessageLookupByLibrary.simpleMessage("Subtitle here"),
        "bottomNavSkeletonTitle":
            MessageLookupByLibrary.simpleMessage("Item number index as title"),
        "camera": MessageLookupByLibrary.simpleMessage("Camera"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "card": MessageLookupByLibrary.simpleMessage("Card"),
        "cartItems": MessageLookupByLibrary.simpleMessage("Cart Items"),
        "changeImage": MessageLookupByLibrary.simpleMessage("Change Image"),
        "changeRoles": MessageLookupByLibrary.simpleMessage("Change Roles"),
        "changeRolesHint":
            MessageLookupByLibrary.simpleMessage("Choose a role for this user"),
        "changeRolesTitle":
            MessageLookupByLibrary.simpleMessage("Change Roles"),
        "changesSaved": m1,
        "checkout": MessageLookupByLibrary.simpleMessage("CheckOut"),
        "chooseFoodCategory":
            MessageLookupByLibrary.simpleMessage("Choose Food Category"),
        "chooseFoodImage":
            MessageLookupByLibrary.simpleMessage("Choose Food Image"),
        "chooseFoodName":
            MessageLookupByLibrary.simpleMessage("Choose Food Name"),
        "chooseFoodPrice":
            MessageLookupByLibrary.simpleMessage("Choose Food Price"),
        "chooseImageButton":
            MessageLookupByLibrary.simpleMessage("Choose Image"),
        "noFoodFound": MessageLookupByLibrary.simpleMessage("No Food Found"),
        "chooseNewRoleHere": MessageLookupByLibrary.simpleMessage("new role"),
        "choosePhoto": MessageLookupByLibrary.simpleMessage("Choose Photo"),
        "chooseProfilePhotoSubtitle":
            MessageLookupByLibrary.simpleMessage("Optional But Recommended"),
        "chooseProfilePhotoTitle":
            MessageLookupByLibrary.simpleMessage("Choose Profile Photo"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "confirmOrder": MessageLookupByLibrary.simpleMessage("Confirm Order"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirm Password"),
        "currentEndTime":
            MessageLookupByLibrary.simpleMessage("CURRENT END TIME"),
        "currentRoleLabel": m2,
        "currentStartTime":
            MessageLookupByLibrary.simpleMessage("CURRENT START TIME"),
        "customerInfo": MessageLookupByLibrary.simpleMessage("Customer Info"),
        "customizeThemeAndLanguage": MessageLookupByLibrary.simpleMessage(
            "Customize Theme and Language"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "deleteWarning": MessageLookupByLibrary.simpleMessage("Delete Warning"),
        "deleteWarningMessage": m3,
        "deliciousFood": MessageLookupByLibrary.simpleMessage("Delicious"),
        "deliveryMethod":
            MessageLookupByLibrary.simpleMessage("Delivery Method"),
        "deriverScreen": MessageLookupByLibrary.simpleMessage("Driver Screen"),
        "desserts": MessageLookupByLibrary.simpleMessage("Desserts"),
        "dessertsEditing": MessageLookupByLibrary.simpleMessage("Desserts"),
        "done": MessageLookupByLibrary.simpleMessage("Done"),
        "doorDelivery": MessageLookupByLibrary.simpleMessage("Door Delivery"),
        "drinks": MessageLookupByLibrary.simpleMessage("Drinks"),
        "drinksEditing": MessageLookupByLibrary.simpleMessage("Drinks"),
        "driver": MessageLookupByLibrary.simpleMessage("Driver"),
        "driverData": MessageLookupByLibrary.simpleMessage("driver data"),
        "driverOrders": MessageLookupByLibrary.simpleMessage("Driver Orders"),
        "driverOrdersLabel":
            MessageLookupByLibrary.simpleMessage("driver orders"),
        "driverRole": MessageLookupByLibrary.simpleMessage("driver"),
        "driverSalary": MessageLookupByLibrary.simpleMessage("Driver Salary"),
        "driverSalaryLabel":
            MessageLookupByLibrary.simpleMessage("driver salary"),
        "editFoods": MessageLookupByLibrary.simpleMessage("Edit Foods"),
        "editOrderTime":
            MessageLookupByLibrary.simpleMessage("Edit Order Time"),
        "editOrderTimeTitle":
            MessageLookupByLibrary.simpleMessage("Edit Order Time"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emailAddress": MessageLookupByLibrary.simpleMessage("Email Address"),
        "endTimeHint": MessageLookupByLibrary.simpleMessage("end time"),
        "enterSecurityCode":
            MessageLookupByLibrary.simpleMessage("Enter Security Code"),
        "error": MessageLookupByLibrary.simpleMessage("Error"),
        "errorUpdatingTime": MessageLookupByLibrary.simpleMessage(
            "error while updating time, please try again"),
        "failedToAddFood": MessageLookupByLibrary.simpleMessage(
            "failed to add food, please try again"),
        "failedToCompleteOrder": MessageLookupByLibrary.simpleMessage(
            "failed to complete order, please try again"),
        "failedToDeleteFood": MessageLookupByLibrary.simpleMessage(
            "failed to delete food, please try again"),
        "failedToUploadImage": MessageLookupByLibrary.simpleMessage(
            "Failed to upload image, please try again"),
        "foodDetails": MessageLookupByLibrary.simpleMessage("Food Details"),
        "foodForYou": MessageLookupByLibrary.simpleMessage("Food For You"),
        "foodNameHint": MessageLookupByLibrary.simpleMessage("Food Name"),
        "foodPriceHint": MessageLookupByLibrary.simpleMessage("Food Price"),
        "foods": MessageLookupByLibrary.simpleMessage("Foods"),
        "foodsEditing": MessageLookupByLibrary.simpleMessage("Foods"),
        "continueToSignUp":
            MessageLookupByLibrary.simpleMessage("Continue to Sign Up"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot Password"),
        "fullName": MessageLookupByLibrary.simpleMessage("Full Name"),
        "gallery": MessageLookupByLibrary.simpleMessage("Gallery"),
        "goLogin": MessageLookupByLibrary.simpleMessage("Go to Login"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "imageCropper": MessageLookupByLibrary.simpleMessage("Image Cropper"),
        "invalidEmailAddress":
            MessageLookupByLibrary.simpleMessage("Invalid email address"),
        "invalidNumber": MessageLookupByLibrary.simpleMessage("Invalid number"),
        "invalidSignin":
            MessageLookupByLibrary.simpleMessage("Invalid sign in"),
        "invalidSignup":
            MessageLookupByLibrary.simpleMessage("Invalid sign up"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "languageOptionArabic": MessageLookupByLibrary.simpleMessage("العربية"),
        "languageOptionEnglish":
            MessageLookupByLibrary.simpleMessage("English"),
        "loginSubtitle": MessageLookupByLibrary.simpleMessage("Welcome back"),
        "loginTitle": MessageLookupByLibrary.simpleMessage("Login"),
        "makeSureToRefresh": MessageLookupByLibrary.simpleMessage(
            "Make Sure To Refresh to Receive Updates"),
        "manageDrivers": MessageLookupByLibrary.simpleMessage("Manage Drivers"),
        "manageDriversTitle":
            MessageLookupByLibrary.simpleMessage("Manage Drivers"),
        "myOrders": MessageLookupByLibrary.simpleMessage("Orders"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "nameLabel": m4,
        "newEndTime": MessageLookupByLibrary.simpleMessage("NEW END TIME"),
        "newStartTime": MessageLookupByLibrary.simpleMessage("NEW START TIME"),
        "noAvailableOrders":
            MessageLookupByLibrary.simpleMessage("No Available Orders"),
        "noDataFound": MessageLookupByLibrary.simpleMessage("No Data Found"),
        "noDriversAvailable":
            MessageLookupByLibrary.simpleMessage("No Drivers Available"),
        "noFoodsFound": MessageLookupByLibrary.simpleMessage("No Foods found"),
        "noItemsFoundInCart":
            MessageLookupByLibrary.simpleMessage("No Items Found In The Cart"),
        "noOrdersFound":
            MessageLookupByLibrary.simpleMessage("No Orders Found"),
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "onboardingEveryone": MessageLookupByLibrary.simpleMessage("Everyone"),
        "onboardingFoodFor": MessageLookupByLibrary.simpleMessage("Food for"),
        "onboardingNext": MessageLookupByLibrary.simpleMessage("N E X T"),
        "orderConfirmedSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Order Confirmed Successfully"),
        "orderDetails": MessageLookupByLibrary.simpleMessage("Order Details"),
        "orderLabel": m5,
        "orderNotAllowed": MessageLookupByLibrary.simpleMessage(
            "Order is not currently allowed"),
        "orderNow": MessageLookupByLibrary.simpleMessage("Order Now"),
        "orderNowButton": MessageLookupByLibrary.simpleMessage("order now"),
        "orderSecurityCode":
            MessageLookupByLibrary.simpleMessage("Order Security Code"),
        "orderSecurityCodeIsWrong": MessageLookupByLibrary.simpleMessage(
            "Order Security Code is Wrong"),
        "ordersOnTheWay":
            MessageLookupByLibrary.simpleMessage("Orders On The Way"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordMustBeAtLeast7": MessageLookupByLibrary.simpleMessage(
            "Password must be at least 7 characters"),
        "passwordResetLinkSent": MessageLookupByLibrary.simpleMessage(
            "Password reset link sent! Check your email."),
        "passwordsDontMatch":
            MessageLookupByLibrary.simpleMessage("Passwords don\'t match"),
        "payment": MessageLookupByLibrary.simpleMessage("Payment"),
        "paymentMethod": MessageLookupByLibrary.simpleMessage("Payment Method"),
        "permissionDenied":
            MessageLookupByLibrary.simpleMessage("Permission Denied"),
        "permissionDeniedMessage": MessageLookupByLibrary.simpleMessage(
            "Please allow permissions in the app settings to continue."),
        "phoneNumber": MessageLookupByLibrary.simpleMessage("Phone Number"),
        "pickUp": MessageLookupByLibrary.simpleMessage("Pick UP"),
        "pleaseChooseFoodImage":
            MessageLookupByLibrary.simpleMessage("Please Choose Food Image"),
        "pleaseSelectRole":
            MessageLookupByLibrary.simpleMessage("Please select a role"),
        "pricePerOrderWhenDriver":
            MessageLookupByLibrary.simpleMessage("price per order"),
        "proceedToPayment":
            MessageLookupByLibrary.simpleMessage("Proceed To Payment"),
        "pricePerOrder":
            MessageLookupByLibrary.simpleMessage("Price Per Order"),
        "signOutConfirmation": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to sign out ?!"),
        "profile": MessageLookupByLibrary.simpleMessage("Profile"),
        "profileAdmin": MessageLookupByLibrary.simpleMessage("Admin Profile"),
        "reset": MessageLookupByLibrary.simpleMessage("reset"),
        "manage": MessageLookupByLibrary.simpleMessage("manage"),
        "profileDriver": MessageLookupByLibrary.simpleMessage("Driver Profile"),
        "profileErrorWithDetails": m6,
        "quantityLabel": m7,
        "removeFromCart":
            MessageLookupByLibrary.simpleMessage("Remove From Cart"),
        "requiredWhenDriver": MessageLookupByLibrary.simpleMessage(
            "This field is required when the role is Driver"),
        "resendEmail": MessageLookupByLibrary.simpleMessage("Re-send Email"),
        "resendEmailIn": m8,
        "resetPasswordHint":
            MessageLookupByLibrary.simpleMessage("Type your email address"),
        "resetPasswordMessage": MessageLookupByLibrary.simpleMessage(
            "We will send a password reset link for you"),
        "resetPasswordTitle":
            MessageLookupByLibrary.simpleMessage("Reset Password"),
        "returnPolicy": MessageLookupByLibrary.simpleMessage("Return Policy"),
        "returnPolicyMessage": MessageLookupByLibrary.simpleMessage(
            "All our foods are double checked before leaving our stores so by any case you found a broken food please contact our hotline immediately."),
        "saveChanges": MessageLookupByLibrary.simpleMessage("Save Changes"),
        "search": MessageLookupByLibrary.simpleMessage("Search"),
        "securityCode": MessageLookupByLibrary.simpleMessage("Security Code"),
        "seeMore": MessageLookupByLibrary.simpleMessage("See More"),
        "sendEmail": MessageLookupByLibrary.simpleMessage("Send Email"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "signIn": MessageLookupByLibrary.simpleMessage("Sign In"),
        "signUp": MessageLookupByLibrary.simpleMessage("Sign Up"),
        "signUpSubtitle": MessageLookupByLibrary.simpleMessage("Join us today"),
        "signUpSuccess":
            MessageLookupByLibrary.simpleMessage("Signed up successfully"),
        "signUpSuccessMessage":
            MessageLookupByLibrary.simpleMessage("You Successfully Signed Up"),
        "signUpTitle": MessageLookupByLibrary.simpleMessage("Create Account"),
        "snacks": MessageLookupByLibrary.simpleMessage("Snacks"),
        "snacksEditing": MessageLookupByLibrary.simpleMessage("Snacks"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Something went wrong"),
        "splashLoading": MessageLookupByLibrary.simpleMessage("Loading"),
        "startTimeHint": MessageLookupByLibrary.simpleMessage("start time"),
        "success": MessageLookupByLibrary.simpleMessage("Success"),
        "swipeForMoreDetails": MessageLookupByLibrary.simpleMessage(
            "Swipe The Item For More Details"),
        "themeAndLanguage":
            MessageLookupByLibrary.simpleMessage("Theme and Language"),
        "themeOptionDark": MessageLookupByLibrary.simpleMessage("Dark"),
        "themeOptionLight": MessageLookupByLibrary.simpleMessage("Light"),
        "themeOptionSystem": MessageLookupByLibrary.simpleMessage("System"),
        "themeSectionTitle": MessageLookupByLibrary.simpleMessage("Theme"),
        "thisFieldIsRequired":
            MessageLookupByLibrary.simpleMessage("This field is required"),
        "totalPrice": MessageLookupByLibrary.simpleMessage("Total Price : "),
        "totalPriceLabel": m9,
        "tryAgain": MessageLookupByLibrary.simpleMessage("Try Again"),
        "tryAgainLater":
            MessageLookupByLibrary.simpleMessage("Try again later"),
        "unExpectedError": MessageLookupByLibrary.simpleMessage(
            "An unexpected error occurred, please try again"),
        "updateTime": MessageLookupByLibrary.simpleMessage("update time"),
        "updatingTimeDone":
            MessageLookupByLibrary.simpleMessage("updating time is done"),
        "userAlreadyExists": MessageLookupByLibrary.simpleMessage(
            "This email is already registered"),
        "userNotFound": MessageLookupByLibrary.simpleMessage("User not found"),
        "userRole": MessageLookupByLibrary.simpleMessage("user"),
        "usernameMustBeAtLeast4": MessageLookupByLibrary.simpleMessage(
            "Username must be at least 4 characters"),
        "validSignin": MessageLookupByLibrary.simpleMessage("Valid sign in"),
        "validSignup": MessageLookupByLibrary.simpleMessage("Valid sign up"),
        "verifyEmailCheckInbox":
            MessageLookupByLibrary.simpleMessage("Check your email"),
        "verifyEmailMessage": MessageLookupByLibrary.simpleMessage(
            "We sent a verification link to verify your account."),
        "verifyEmailTitle":
            MessageLookupByLibrary.simpleMessage("Verify Email"),
        "wrongPassword": MessageLookupByLibrary.simpleMessage("Wrong password"),
        "youCanSearchFoods":
            MessageLookupByLibrary.simpleMessage("you can search foods")
      };
}
