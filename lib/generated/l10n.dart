// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Price Per Order`
  String get pricePerOrder {
    return Intl.message(
      'Price Per Order',
      name: 'pricePerOrder',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out Confirmation`
  String get signOutConfirmation {
    return Intl.message(
      'Are you sure you want to sign out ?!',
      name: 'signOutConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `reset`
  String get reset {
    return Intl.message(
      'reset',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `manage`
  String get manage {
    return Intl.message(
      'manage',
      name: 'manage',
      desc: '',
      args: [],
    );
  }

  /// `Driver Profile`
  String get profileDriver {
    return Intl.message(
      'Driver Profile',
      name: 'profileDriver',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Error: {error}`
  String profileErrorWithDetails(Object error) {
    return Intl.message(
      'Error: $error',
      name: 'profileErrorWithDetails',
      desc: '',
      args: [error],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get emailAddress {
    return Intl.message(
      'Email Address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email address`
  String get invalidEmailAddress {
    return Intl.message(
      'Invalid email address',
      name: 'invalidEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get thisFieldIsRequired {
    return Intl.message(
      'This field is required',
      name: 'thisFieldIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `User not found`
  String get userNotFound {
    return Intl.message(
      'User not found',
      name: 'userNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password`
  String get wrongPassword {
    return Intl.message(
      'Wrong password',
      name: 'wrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `This email is already registered`
  String get userAlreadyExists {
    return Intl.message(
      'This email is already registered',
      name: 'userAlreadyExists',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Go to Login`
  String get goLogin {
    return Intl.message(
      'Go to Login',
      name: 'goLogin',
      desc: '',
      args: [],
    );
  }

  /// `Signed up successfully`
  String get signUpSuccess {
    return Intl.message(
      'Signed up successfully',
      name: 'signUpSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Admin Profile`
  String get profileAdmin {
    return Intl.message(
      'Admin Profile',
      name: 'profileAdmin',
      desc: '',
      args: [],
    );
  }

  /// `Driver Orders`
  String get driverOrders {
    return Intl.message(
      'Driver Orders',
      name: 'driverOrders',
      desc: '',
      args: [],
    );
  }

  /// `Driver Salary`
  String get driverSalary {
    return Intl.message(
      'Driver Salary',
      name: 'driverSalary',
      desc: '',
      args: [],
    );
  }

  /// `Account Info`
  String get accountInfo {
    return Intl.message(
      'Account Info',
      name: 'accountInfo',
      desc: '',
      args: [],
    );
  }

  /// `Customize Theme and Language`
  String get customizeThemeAndLanguage {
    return Intl.message(
      'Customize Theme and Language',
      name: 'customizeThemeAndLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Edit Foods`
  String get editFoods {
    return Intl.message(
      'Edit Foods',
      name: 'editFoods',
      desc: '',
      args: [],
    );
  }

  /// `Add New Food`
  String get addNewFood {
    return Intl.message(
      'Add New Food',
      name: 'addNewFood',
      desc: '',
      args: [],
    );
  }

  /// `Manage Drivers`
  String get manageDrivers {
    return Intl.message(
      'Manage Drivers',
      name: 'manageDrivers',
      desc: '',
      args: [],
    );
  }

  /// `Change Roles`
  String get changeRoles {
    return Intl.message(
      'Change Roles',
      name: 'changeRoles',
      desc: '',
      args: [],
    );
  }

  /// `Edit Order Time`
  String get editOrderTime {
    return Intl.message(
      'Edit Order Time',
      name: 'editOrderTime',
      desc: '',
      args: [],
    );
  }

  /// `Theme and Language`
  String get themeAndLanguage {
    return Intl.message(
      'Theme and Language',
      name: 'themeAndLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Order Details`
  String get orderDetails {
    return Intl.message(
      'Order Details',
      name: 'orderDetails',
      desc: '',
      args: [],
    );
  }

  /// `order : {order}`
  String orderLabel(Object order) {
    return Intl.message(
      'order : $order',
      name: 'orderLabel',
      desc: '',
      args: [order],
    );
  }

  /// `quantity : {quantity}`
  String quantityLabel(Object quantity) {
    return Intl.message(
      'quantity : $quantity',
      name: 'quantityLabel',
      desc: '',
      args: [quantity],
    );
  }

  /// `total price : {totalPrice}`
  String totalPriceLabel(Object totalPrice) {
    return Intl.message(
      'total price : $totalPrice',
      name: 'totalPriceLabel',
      desc: '',
      args: [totalPrice],
    );
  }

  /// `Customer Info`
  String get customerInfo {
    return Intl.message(
      'Customer Info',
      name: 'customerInfo',
      desc: '',
      args: [],
    );
  }

  /// `Security Code`
  String get securityCode {
    return Intl.message(
      'Security Code',
      name: 'securityCode',
      desc: '',
      args: [],
    );
  }

  /// `Enter Security Code`
  String get enterSecurityCode {
    return Intl.message(
      'Enter Security Code',
      name: 'enterSecurityCode',
      desc: '',
      args: [],
    );
  }

  /// `Order Security Code`
  String get orderSecurityCode {
    return Intl.message(
      'Order Security Code',
      name: 'orderSecurityCode',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Order`
  String get confirmOrder {
    return Intl.message(
      'Confirm Order',
      name: 'confirmOrder',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Delete Warning`
  String get deleteWarning {
    return Intl.message(
      'Delete Warning',
      name: 'deleteWarning',
      desc: '',
      args: [],
    );
  }

  /// `Do You Want To Delete {foodName} ?!`
  String deleteWarningMessage(Object foodName) {
    return Intl.message(
      'Do You Want To Delete $foodName ?!',
      name: 'deleteWarningMessage',
      desc: '',
      args: [foodName],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `failed to delete food, please try again`
  String get failedToDeleteFood {
    return Intl.message(
      'failed to delete food, please try again',
      name: 'failedToDeleteFood',
      desc: '',
      args: [],
    );
  }

  /// `Order is not currently allowed`
  String get orderNotAllowed {
    return Intl.message(
      'Order is not currently allowed',
      name: 'orderNotAllowed',
      desc: '',
      args: [],
    );
  }

  /// `Allowed time is between {start} and {end}`
  String allowedTimeBetween(Object start, Object end) {
    return Intl.message(
      'Allowed time is between $start and $end',
      name: 'allowedTimeBetween',
      desc: '',
      args: [start, end],
    );
  }

  /// `you can search foods`
  String get youCanSearchFoods {
    return Intl.message(
      'you can search foods',
      name: 'youCanSearchFoods',
      desc: '',
      args: [],
    );
  }

  /// `No Foods found`
  String get noFoodsFound {
    return Intl.message(
      'No Foods found',
      name: 'noFoodsFound',
      desc: '',
      args: [],
    );
  }

  /// `Change Roles`
  String get changeRolesTitle {
    return Intl.message(
      'Change Roles',
      name: 'changeRolesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Choose a role for this user`
  String get changeRolesHint {
    return Intl.message(
      'Choose a role for this user',
      name: 'changeRolesHint',
      desc: '',
      args: [],
    );
  }

  /// `choose new role here`
  String get chooseNewRoleHere {
    return Intl.message(
      'new role',
      name: 'chooseNewRoleHere',
      desc: '',
      args: [],
    );
  }

  /// `price per order (when new role is driver)`
  String get pricePerOrderWhenDriver {
    return Intl.message(
      'price per order',
      name: 'pricePerOrderWhenDriver',
      desc: '',
      args: [],
    );
  }

  /// `user`
  String get userRole {
    return Intl.message(
      'user',
      name: 'userRole',
      desc: '',
      args: [],
    );
  }

  /// `driver`
  String get driverRole {
    return Intl.message(
      'driver',
      name: 'driverRole',
      desc: '',
      args: [],
    );
  }

  /// `admin`
  String get adminRole {
    return Intl.message(
      'admin',
      name: 'adminRole',
      desc: '',
      args: [],
    );
  }

  /// `No Food Found`
  String get noFoodFound {
    return Intl.message(
      'No Food Found',
      name: 'noFoodFound',
      desc: '',
      args: [],
    );
  }

  /// `Changes saved for {role}`
  String changesSaved(Object role) {
    return Intl.message(
      'Changes saved for $role',
      name: 'changesSaved',
      desc: '',
      args: [role],
    );
  }

  /// `Please select a role`
  String get pleaseSelectRole {
    return Intl.message(
      'Please select a role',
      name: 'pleaseSelectRole',
      desc: '',
      args: [],
    );
  }

  /// `This field is required when the role is Driver`
  String get requiredWhenDriver {
    return Intl.message(
      'This field is required when the role is Driver',
      name: 'requiredWhenDriver',
      desc: '',
      args: [],
    );
  }

  /// `Invalid number`
  String get invalidNumber {
    return Intl.message(
      'Invalid number',
      name: 'invalidNumber',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get saveChanges {
    return Intl.message(
      'Save Changes',
      name: 'saveChanges',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `{name}`
  String nameLabel(Object name) {
    return Intl.message(
      '$name',
      name: 'nameLabel',
      desc: '',
      args: [name],
    );
  }

  /// `{role}`
  String currentRoleLabel(Object role) {
    return Intl.message(
      '$role',
      name: 'currentRoleLabel',
      desc: '',
      args: [role],
    );
  }

  /// `Choose Profile Photo`
  String get chooseProfilePhotoTitle {
    return Intl.message(
      'Choose Profile Photo',
      name: 'chooseProfilePhotoTitle',
      desc: '',
      args: [],
    );
  }

  /// `Optional But Recommended`
  String get chooseProfilePhotoSubtitle {
    return Intl.message(
      'Optional But Recommended',
      name: 'chooseProfilePhotoSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Choose Photo`
  String get choosePhoto {
    return Intl.message(
      'Choose Photo',
      name: 'choosePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Image Cropper`
  String get imageCropper {
    return Intl.message(
      'Image Cropper',
      name: 'imageCropper',
      desc: '',
      args: [],
    );
  }

  /// `Permission Denied`
  String get permissionDenied {
    return Intl.message(
      'Permission Denied',
      name: 'permissionDenied',
      desc: '',
      args: [],
    );
  }

  /// `Please allow permissions in the app settings to continue.`
  String get permissionDeniedMessage {
    return Intl.message(
      'Please allow permissions in the app settings to continue.',
      name: 'permissionDeniedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Failed to upload image, please try again`
  String get failedToUploadImage {
    return Intl.message(
      'Failed to upload image, please try again',
      name: 'failedToUploadImage',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPasswordTitle {
    return Intl.message(
      'Reset Password',
      name: 'resetPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Type your email address`
  String get resetPasswordHint {
    return Intl.message(
      'Type your email address',
      name: 'resetPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `We will send a password reset link for you`
  String get resetPasswordMessage {
    return Intl.message(
      'We will send a password reset link for you',
      name: 'resetPasswordMessage',
      desc: '',
      args: [],
    );
  }

  /// `Send Email`
  String get sendEmail {
    return Intl.message(
      'Send Email',
      name: 'sendEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password reset link sent! Check your email.`
  String get passwordResetLinkSent {
    return Intl.message(
      'Password reset link sent! Check your email.',
      name: 'passwordResetLinkSent',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get tryAgain {
    return Intl.message(
      'Try Again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Food for`
  String get onboardingFoodFor {
    return Intl.message(
      'Food for',
      name: 'onboardingFoodFor',
      desc: '',
      args: [],
    );
  }

  /// `Everyone`
  String get onboardingEveryone {
    return Intl.message(
      'Everyone',
      name: 'onboardingEveryone',
      desc: '',
      args: [],
    );
  }

  /// `N E X T`
  String get onboardingNext {
    return Intl.message(
      'N E X T',
      name: 'onboardingNext',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginTitle {
    return Intl.message(
      'Login',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back`
  String get loginSubtitle {
    return Intl.message(
      'Welcome back',
      name: 'loginSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get signUpTitle {
    return Intl.message(
      'Create Account',
      name: 'signUpTitle',
      desc: '',
      args: [],
    );
  }

  /// `Join us today`
  String get signUpSubtitle {
    return Intl.message(
      'Join us today',
      name: 'signUpSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Loading`
  String get splashLoading {
    return Intl.message(
      'Loading',
      name: 'splashLoading',
      desc: '',
      args: [],
    );
  }

  /// `Verify Email`
  String get verifyEmailTitle {
    return Intl.message(
      'Verify Email',
      name: 'verifyEmailTitle',
      desc: '',
      args: [],
    );
  }

  /// `Check your email`
  String get verifyEmailCheckInbox {
    return Intl.message(
      'Check your email',
      name: 'verifyEmailCheckInbox',
      desc: '',
      args: [],
    );
  }

  /// `We sent a verification link to verify your account.`
  String get verifyEmailMessage {
    return Intl.message(
      'We sent a verification link to verify your account.',
      name: 'verifyEmailMessage',
      desc: '',
      args: [],
    );
  }

  /// `Re-send Email`
  String get resendEmail {
    return Intl.message(
      'Re-send Email',
      name: 'resendEmail',
      desc: '',
      args: [],
    );
  }

  /// `Re-send in {seconds} seconds`
  String resendEmailIn(Object seconds) {
    return Intl.message(
      'Re-send in $seconds seconds',
      name: 'resendEmailIn',
      desc: '',
      args: [seconds],
    );
  }

  /// `Try again later`
  String get tryAgainLater {
    return Intl.message(
      'Try again later',
      name: 'tryAgainLater',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 7 characters`
  String get passwordMustBeAtLeast7 {
    return Intl.message(
      'Password must be at least 7 characters',
      name: 'passwordMustBeAtLeast7',
      desc: '',
      args: [],
    );
  }

  /// `Username must be at least 4 characters`
  String get usernameMustBeAtLeast4 {
    return Intl.message(
      'Username must be at least 4 characters',
      name: 'usernameMustBeAtLeast4',
      desc: '',
      args: [],
    );
  }

  /// `Passwords don't match`
  String get passwordsDontMatch {
    return Intl.message(
      'Passwords don\'t match',
      name: 'passwordsDontMatch',
      desc: '',
      args: [],
    );
  }

  /// `Valid sign in`
  String get validSignin {
    return Intl.message(
      'Valid sign in',
      name: 'validSignin',
      desc: '',
      args: [],
    );
  }

  /// `Invalid sign in`
  String get invalidSignin {
    return Intl.message(
      'Invalid sign in',
      name: 'invalidSignin',
      desc: '',
      args: [],
    );
  }

  /// `Valid sign up`
  String get validSignup {
    return Intl.message(
      'Valid sign up',
      name: 'validSignup',
      desc: '',
      args: [],
    );
  }

  /// `Invalid sign up`
  String get invalidSignup {
    return Intl.message(
      'Invalid sign up',
      name: 'invalidSignup',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get authSignIn {
    return Intl.message(
      'Sign In',
      name: 'authSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get authSignUp {
    return Intl.message(
      'Sign Up',
      name: 'authSignUp',
      desc: '',
      args: [],
    );
  }

  /// `You Successfully Signed Up`
  String get signUpSuccessMessage {
    return Intl.message(
      'You Successfully Signed Up',
      name: 'signUpSuccessMessage',
      desc: '',
      args: [],
    );
  }

  /// `No data available`
  String get accountInfoNoData {
    return Intl.message(
      'No data available',
      name: 'accountInfoNoData',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get accountInfoSignOut {
    return Intl.message(
      'Sign Out',
      name: 'accountInfoSignOut',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Choose Food Category`
  String get chooseFoodCategory {
    return Intl.message(
      'Choose Food Category',
      name: 'chooseFoodCategory',
      desc: '',
      args: [],
    );
  }

  /// `Choose Food Name`
  String get chooseFoodName {
    return Intl.message(
      'Choose Food Name',
      name: 'chooseFoodName',
      desc: '',
      args: [],
    );
  }

  /// `Food Name`
  String get foodNameHint {
    return Intl.message(
      'Food Name',
      name: 'foodNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Choose Food Price`
  String get chooseFoodPrice {
    return Intl.message(
      'Choose Food Price',
      name: 'chooseFoodPrice',
      desc: '',
      args: [],
    );
  }

  /// `Food Price`
  String get foodPriceHint {
    return Intl.message(
      'Food Price',
      name: 'foodPriceHint',
      desc: '',
      args: [],
    );
  }

  /// `Choose Food Image`
  String get chooseFoodImage {
    return Intl.message(
      'Choose Food Image',
      name: 'chooseFoodImage',
      desc: '',
      args: [],
    );
  }

  /// `Change Image`
  String get changeImage {
    return Intl.message(
      'Change Image',
      name: 'changeImage',
      desc: '',
      args: [],
    );
  }

  /// `Please Choose Food Image`
  String get pleaseChooseFoodImage {
    return Intl.message(
      'Please Choose Food Image',
      name: 'pleaseChooseFoodImage',
      desc: '',
      args: [],
    );
  }

  /// `ADD FOOD`
  String get addFoodButton {
    return Intl.message(
      'ADD FOOD',
      name: 'addFoodButton',
      desc: '',
      args: [],
    );
  }

  /// `Choose Image`
  String get chooseImageButton {
    return Intl.message(
      'Choose Image',
      name: 'chooseImageButton',
      desc: '',
      args: [],
    );
  }

  /// `failed to add food, please try again`
  String get failedToAddFood {
    return Intl.message(
      'failed to add food, please try again',
      name: 'failedToAddFood',
      desc: '',
      args: [],
    );
  }

  /// `Cart Items`
  String get cartItems {
    return Intl.message(
      'Cart Items',
      name: 'cartItems',
      desc: '',
      args: [],
    );
  }

  /// `Swipe The Item For More Details`
  String get swipeForMoreDetails {
    return Intl.message(
      'Swipe The Item For More Details',
      name: 'swipeForMoreDetails',
      desc: '',
      args: [],
    );
  }

  /// `Food Details`
  String get foodDetails {
    return Intl.message(
      'Food Details',
      name: 'foodDetails',
      desc: '',
      args: [],
    );
  }

  /// `Add to Cart`
  String get addToCart {
    return Intl.message(
      'Add to Cart',
      name: 'addToCart',
      desc: '',
      args: [],
    );
  }

  /// `Remove From Cart`
  String get removeFromCart {
    return Intl.message(
      'Remove From Cart',
      name: 'removeFromCart',
      desc: '',
      args: [],
    );
  }

  /// `Return Policy`
  String get returnPolicy {
    return Intl.message(
      'Return Policy',
      name: 'returnPolicy',
      desc: '',
      args: [],
    );
  }

  /// `All our foods are double checked before leaving our stores so by any case you found a broken food please contact our hotline immediately.`
  String get returnPolicyMessage {
    return Intl.message(
      'All our foods are double checked before leaving our stores so by any case you found a broken food please contact our hotline immediately.',
      name: 'returnPolicyMessage',
      desc: '',
      args: [],
    );
  }

  /// `Order Now`
  String get orderNow {
    return Intl.message(
      'Order Now',
      name: 'orderNow',
      desc: '',
      args: [],
    );
  }

  /// `CheckOut`
  String get checkout {
    return Intl.message(
      'CheckOut',
      name: 'checkout',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get paymentMethod {
    return Intl.message(
      'Payment Method',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Card`
  String get card {
    return Intl.message(
      'Card',
      name: 'card',
      desc: '',
      args: [],
    );
  }

  /// `Bank Account`
  String get bankAccount {
    return Intl.message(
      'Bank Account',
      name: 'bankAccount',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Method`
  String get deliveryMethod {
    return Intl.message(
      'Delivery Method',
      name: 'deliveryMethod',
      desc: '',
      args: [],
    );
  }

  /// `Pick UP`
  String get pickUp {
    return Intl.message(
      'Pick UP',
      name: 'pickUp',
      desc: '',
      args: [],
    );
  }

  /// `Door Delivery`
  String get doorDelivery {
    return Intl.message(
      'Door Delivery',
      name: 'doorDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Total Price : `
  String get totalPrice {
    return Intl.message(
      'Total Price : ',
      name: 'totalPrice',
      desc: '',
      args: [],
    );
  }

  /// `Proceed To Payment`
  String get proceedToPayment {
    return Intl.message(
      'Proceed To Payment',
      name: 'proceedToPayment',
      desc: '',
      args: [],
    );
  }

  /// `All Available Foods`
  String get allAvailableFoods {
    return Intl.message(
      'All Available Foods',
      name: 'allAvailableFoods',
      desc: '',
      args: [],
    );
  }

  /// `Foods`
  String get foodsEditing {
    return Intl.message(
      'Foods',
      name: 'foodsEditing',
      desc: '',
      args: [],
    );
  }

  /// `Drinks`
  String get drinksEditing {
    return Intl.message(
      'Drinks',
      name: 'drinksEditing',
      desc: '',
      args: [],
    );
  }

  /// `Snacks`
  String get snacksEditing {
    return Intl.message(
      'Snacks',
      name: 'snacksEditing',
      desc: '',
      args: [],
    );
  }

  /// `Desserts`
  String get dessertsEditing {
    return Intl.message(
      'Desserts',
      name: 'dessertsEditing',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `order now`
  String get orderNowButton {
    return Intl.message(
      'order now',
      name: 'orderNowButton',
      desc: '',
      args: [],
    );
  }

  /// `failed to complete order, please try again`
  String get failedToCompleteOrder {
    return Intl.message(
      'failed to complete order, please try again',
      name: 'failedToCompleteOrder',
      desc: '',
      args: [],
    );
  }

  /// `Foods`
  String get foods {
    return Intl.message(
      'Foods',
      name: 'foods',
      desc: '',
      args: [],
    );
  }

  /// `Drinks`
  String get drinks {
    return Intl.message(
      'Drinks',
      name: 'drinks',
      desc: '',
      args: [],
    );
  }

  /// `Snacks`
  String get snacks {
    return Intl.message(
      'Snacks',
      name: 'snacks',
      desc: '',
      args: [],
    );
  }

  /// `Desserts`
  String get desserts {
    return Intl.message(
      'Desserts',
      name: 'desserts',
      desc: '',
      args: [],
    );
  }

  /// `Manage Drivers`
  String get manageDriversTitle {
    return Intl.message(
      'Manage Drivers',
      name: 'manageDriversTitle',
      desc: '',
      args: [],
    );
  }

  /// `No Items Found In The Cart`
  String get noItemsFoundInCart {
    return Intl.message(
      'No Items Found In The Cart',
      name: 'noItemsFoundInCart',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get myOrders {
    return Intl.message(
      'Orders',
      name: 'myOrders',
      desc: '',
      args: [],
    );
  }

  /// `Driver`
  String get driver {
    return Intl.message(
      'Driver',
      name: 'driver',
      desc: '',
      args: [],
    );
  }

  /// `Item number index as title`
  String get bottomNavSkeletonTitle {
    return Intl.message(
      'Item number index as title',
      name: 'bottomNavSkeletonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Subtitle here`
  String get bottomNavSkeletonSubtitle {
    return Intl.message(
      'Subtitle here',
      name: 'bottomNavSkeletonSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `No Drivers Available`
  String get noDriversAvailable {
    return Intl.message(
      'No Drivers Available',
      name: 'noDriversAvailable',
      desc: '',
      args: [],
    );
  }

  /// `driver data`
  String get driverData {
    return Intl.message(
      'driver data',
      name: 'driverData',
      desc: '',
      args: [],
    );
  }

  /// `driver orders`
  String get driverOrdersLabel {
    return Intl.message(
      'driver orders',
      name: 'driverOrdersLabel',
      desc: '',
      args: [],
    );
  }

  /// `driver salary`
  String get driverSalaryLabel {
    return Intl.message(
      'driver salary',
      name: 'driverSalaryLabel',
      desc: '',
      args: [],
    );
  }

  /// `No Data Found`
  String get noDataFound {
    return Intl.message(
      'No Data Found',
      name: 'noDataFound',
      desc: '',
      args: [],
    );
  }

  /// `Edit Order Time`
  String get editOrderTimeTitle {
    return Intl.message(
      'Edit Order Time',
      name: 'editOrderTimeTitle',
      desc: '',
      args: [],
    );
  }

  /// `CURRENT START TIME`
  String get currentStartTime {
    return Intl.message(
      'CURRENT START TIME',
      name: 'currentStartTime',
      desc: '',
      args: [],
    );
  }

  /// `CURRENT END TIME`
  String get currentEndTime {
    return Intl.message(
      'CURRENT END TIME',
      name: 'currentEndTime',
      desc: '',
      args: [],
    );
  }

  /// `NEW START TIME`
  String get newStartTime {
    return Intl.message(
      'NEW START TIME',
      name: 'newStartTime',
      desc: '',
      args: [],
    );
  }

  /// `NEW END TIME`
  String get newEndTime {
    return Intl.message(
      'NEW END TIME',
      name: 'newEndTime',
      desc: '',
      args: [],
    );
  }

  /// `start time`
  String get startTimeHint {
    return Intl.message(
      'start time',
      name: 'startTimeHint',
      desc: '',
      args: [],
    );
  }

  /// `end time`
  String get endTimeHint {
    return Intl.message(
      'end time',
      name: 'endTimeHint',
      desc: '',
      args: [],
    );
  }

  /// `update time`
  String get updateTime {
    return Intl.message(
      'update time',
      name: 'updateTime',
      desc: '',
      args: [],
    );
  }

  /// `updating time is done`
  String get updatingTimeDone {
    return Intl.message(
      'updating time is done',
      name: 'updatingTimeDone',
      desc: '',
      args: [],
    );
  }

  /// `error while updating time, please try again`
  String get errorUpdatingTime {
    return Intl.message(
      'error while updating time, please try again',
      name: 'errorUpdatingTime',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get themeSectionTitle {
    return Intl.message(
      'Theme',
      name: 'themeSectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get languageOptionEnglish {
    return Intl.message(
      'English',
      name: 'languageOptionEnglish',
      desc: '',
      args: [],
    );
  }

  /// `العربية`
  String get languageOptionArabic {
    return Intl.message(
      'العربية',
      name: 'languageOptionArabic',
      desc: '',
      args: [],
    );
  }

  /// `System`
  String get themeOptionSystem {
    return Intl.message(
      'System',
      name: 'themeOptionSystem',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get themeOptionLight {
    return Intl.message(
      'Light',
      name: 'themeOptionLight',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get themeOptionDark {
    return Intl.message(
      'Dark',
      name: 'themeOptionDark',
      desc: '',
      args: [],
    );
  }

  /// `Orders On The Way`
  String get ordersOnTheWay {
    return Intl.message(
      'Orders On The Way',
      name: 'ordersOnTheWay',
      desc: '',
      args: [],
    );
  }

  /// `No Orders Found`
  String get noOrdersFound {
    return Intl.message(
      'No Orders Found',
      name: 'noOrdersFound',
      desc: '',
      args: [],
    );
  }

  /// `Delicious`
  String get deliciousFood {
    return Intl.message(
      'Delicious',
      name: 'deliciousFood',
      desc: '',
      args: [],
    );
  }

  /// `Food For You`
  String get foodForYou {
    return Intl.message(
      'Food For You',
      name: 'foodForYou',
      desc: '',
      args: [],
    );
  }

  /// `See More`
  String get seeMore {
    return Intl.message(
      'See More',
      name: 'seeMore',
      desc: '',
      args: [],
    );
  }

  /// `Driver Screen`
  String get deriverScreen {
    return Intl.message(
      'Driver Screen',
      name: 'deriverScreen',
      desc: '',
      args: [],
    );
  }

  /// `Make Sure To Refresh to Receive Updates`
  String get makeSureToRefresh {
    return Intl.message(
      'Make Sure To Refresh to Receive Updates',
      name: 'makeSureToRefresh',
      desc: '',
      args: [],
    );
  }

  /// `No Available Orders`
  String get noAvailableOrders {
    return Intl.message(
      'No Available Orders',
      name: 'noAvailableOrders',
      desc: '',
      args: [],
    );
  }

  /// `Order Confirmed Successfully`
  String get orderConfirmedSuccessfully {
    return Intl.message(
      'Order Confirmed Successfully',
      name: 'orderConfirmedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Order Security Code is Wrong`
  String get orderSecurityCodeIsWrong {
    return Intl.message(
      'Order Security Code is Wrong',
      name: 'orderSecurityCodeIsWrong',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected error occurred, please try again`
  String get unExpectedError {
    return Intl.message(
      'An unexpected error occurred, please try again',
      name: 'unExpectedError',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
