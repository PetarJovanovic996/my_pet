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

  /// `Hello`
  String get hello {
    return Intl.message(
      'Hello',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to the app!`
  String get welcome {
    return Intl.message(
      'Welcome to the app!',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Lets start`
  String get welcomeButton {
    return Intl.message(
      'Lets start',
      name: 'welcomeButton',
      desc: '',
      args: [],
    );
  }

  /// `MY PET`
  String get appName {
    return Intl.message(
      'MY PET',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `FOR YOU & YOUR FRIEND`
  String get welcomeViewMessage {
    return Intl.message(
      'FOR YOU & YOUR FRIEND',
      name: 'welcomeViewMessage',
      desc: '',
      args: [],
    );
  }

  /// `Register / Sign In`
  String get signInORregister {
    return Intl.message(
      'Register / Sign In',
      name: 'signInORregister',
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

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Successfull Registration`
  String get successfullRegistration {
    return Intl.message(
      'Successfull Registration',
      name: 'successfullRegistration',
      desc: '',
      args: [],
    );
  }

  /// `Registration Failed`
  String get invalidRegistration {
    return Intl.message(
      'Registration Failed',
      name: 'invalidRegistration',
      desc: '',
      args: [],
    );
  }

  /// `Enter user data`
  String get enterUserData {
    return Intl.message(
      'Enter user data',
      name: 'enterUserData',
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

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Name`
  String get invalidName {
    return Intl.message(
      'Invalid Name',
      name: 'invalidName',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Username`
  String get invalidUserName {
    return Intl.message(
      'Invalid Username',
      name: 'invalidUserName',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Email`
  String get invalidEmail {
    return Intl.message(
      'Invalid Email',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Password`
  String get invalidPassword {
    return Intl.message(
      'Invalid Password',
      name: 'invalidPassword',
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

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password dont match`
  String get passwordDontMatch {
    return Intl.message(
      'Password dont match',
      name: 'passwordDontMatch',
      desc: '',
      args: [],
    );
  }

  /// `Confirm your password`
  String get confirmPassword {
    return Intl.message(
      'Confirm your password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `You are logged in`
  String get successfullSignIn {
    return Intl.message(
      'You are logged in',
      name: 'successfullSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Log In`
  String get invalidSignIn {
    return Intl.message(
      'Invalid Log In',
      name: 'invalidSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email and password`
  String get enterSignInInfo {
    return Intl.message(
      'Enter your email and password',
      name: 'enterSignInInfo',
      desc: '',
      args: [],
    );
  }

  /// `You are almost there!`
  String get almostThere {
    return Intl.message(
      'You are almost there!',
      name: 'almostThere',
      desc: '',
      args: [],
    );
  }

  /// `News Feed`
  String get newsFeed {
    return Intl.message(
      'News Feed',
      name: 'newsFeed',
      desc: '',
      args: [],
    );
  }

  /// `Explore`
  String get explore {
    return Intl.message(
      'Explore',
      name: 'explore',
      desc: '',
      args: [],
    );
  }

  /// `Media`
  String get media {
    return Intl.message(
      'Media',
      name: 'media',
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

  /// `What's new?`
  String get newsFeedAppBarTitle {
    return Intl.message(
      'What\'s new?',
      name: 'newsFeedAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Explore the world`
  String get exploreppBarTitle {
    return Intl.message(
      'Explore the world',
      name: 'exploreppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Share your gallery`
  String get mediappBarTitle {
    return Intl.message(
      'Share your gallery',
      name: 'mediappBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
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

  /// `Change Language`
  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Change Theme`
  String get changeTheme {
    return Intl.message(
      'Change Theme',
      name: 'changeTheme',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message(
      'Light',
      name: 'light',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get dark {
    return Intl.message(
      'Dark',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message(
      'Log Out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure? This will permanently delete your account.`
  String get confirmDeleteAccount {
    return Intl.message(
      'Are you sure? This will permanently delete your account.',
      name: 'confirmDeleteAccount',
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

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Edit Picture`
  String get editPicture {
    return Intl.message(
      'Edit Picture',
      name: 'editPicture',
      desc: '',
      args: [],
    );
  }

  /// `Successfull Edit! Please log in once again`
  String get successfullEditOfUserData {
    return Intl.message(
      'Successfull Edit! Please log in once again',
      name: 'successfullEditOfUserData',
      desc: '',
      args: [],
    );
  }

  /// `Enter New Password`
  String get enterNewPassword {
    return Intl.message(
      'Enter New Password',
      name: 'enterNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter Current Password`
  String get enterCurrentPassword {
    return Intl.message(
      'Enter Current Password',
      name: 'enterCurrentPassword',
      desc: '',
      args: [],
    );
  }

  /// `Username is already taken`
  String get usernameTaken {
    return Intl.message(
      'Username is already taken',
      name: 'usernameTaken',
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
      Locale.fromSubtags(languageCode: 'sr'),
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
