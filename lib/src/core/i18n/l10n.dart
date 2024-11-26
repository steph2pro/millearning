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

class I18n {
  I18n();

  static I18n? _current;

  static I18n get current {
    assert(_current != null,
        'No instance of I18n was loaded. Try to initialize the I18n delegate before accessing I18n.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<I18n> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = I18n();
      I18n._current = instance;

      return instance;
    });
  }

  static I18n of(BuildContext context) {
    final instance = I18n.maybeOf(context);
    assert(instance != null,
        'No instance of I18n present in the widget tree. Did you add I18n.delegate in localizationsDelegates?');
    return instance!;
  }

  static I18n? maybeOf(BuildContext context) {
    return Localizations.of<I18n>(context, I18n);
  }

  /// `Sign In`
  String get login_title {
    return Intl.message(
      'Sign In',
      name: 'login_title',
      desc: '',
      args: [],
    );
  }

  /// `Hi! Welcome back, you've been missed`
  String get login_subtitle {
    return Intl.message(
      'Hi! Welcome back, you\'ve been missed',
      name: 'login_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get login_emailLabel {
    return Intl.message(
      'Email',
      name: 'login_emailLabel',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get nameLabel {
    return Intl.message(
      'Name',
      name: 'nameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Jhone Doe`
  String get namelHint {
    return Intl.message(
      'Jhone Doe',
      name: 'namelHint',
      desc: '',
      args: [],
    );
  }

  /// `Ex: KpNqg@example.com`
  String get login_emailHint {
    return Intl.message(
      'Ex: KpNqg@example.com',
      name: 'login_emailHint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get login_passwordLabel {
    return Intl.message(
      'Password',
      name: 'login_passwordLabel',
      desc: '',
      args: [],
    );
  }

  /// `************`
  String get login_passwordHint {
    return Intl.message(
      '************',
      name: 'login_passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get login_forgotPasswordLabel {
    return Intl.message(
      'Forgot password?',
      name: 'login_forgotPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get login_googleBtnLabel {
    return Intl.message(
      'Sign in with Google',
      name: 'login_googleBtnLabel',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Apple`
  String get login_appleBtnLabel {
    return Intl.message(
      'Sign in with Apple',
      name: 'login_appleBtnLabel',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login_submitBtnLabel {
    return Intl.message(
      'Login',
      name: 'login_submitBtnLabel',
      desc: '',
      args: [],
    );
  }

  /// `Please wait...`
  String get loadingDialog_content {
    return Intl.message(
      'Please wait...',
      name: 'loadingDialog_content',
      desc: '',
      args: [],
    );
  }

  /// `Or sign in with`
  String get orSign {
    return Intl.message(
      'Or sign in with',
      name: 'orSign',
      desc: '',
      args: [],
    );
  }

  /// `Finding the`
  String get findingThe {
    return Intl.message(
      'Finding the',
      name: 'findingThe',
      desc: '',
      args: [],
    );
  }

  /// `Perfect Online Course`
  String get perfect {
    return Intl.message(
      'Perfect Online Course',
      name: 'perfect',
      desc: '',
      args: [],
    );
  }

  /// `for You`
  String get forYou {
    return Intl.message(
      'for You',
      name: 'forYou',
      desc: '',
      args: [],
    );
  }

  /// `App to search and discover the most suitable place for you to stay.`
  String get appTo {
    return Intl.message(
      'App to search and discover the most suitable place for you to stay.',
      name: 'appTo',
      desc: '',
      args: [],
    );
  }

  /// `Let's Get Started`
  String get letStarted {
    return Intl.message(
      'Let\'s Get Started',
      name: 'letStarted',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHave {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHave',
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

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account??`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account??',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Fill your information below or register with your social account.`
  String get fillYourInformation {
    return Intl.message(
      'Fill your information below or register with your social account.',
      name: 'fillYourInformation',
      desc: '',
      args: [],
    );
  }

  /// `Agree with`
  String get agreeWith {
    return Intl.message(
      'Agree with',
      name: 'agreeWith',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Condition`
  String get termsCondition {
    return Intl.message(
      'Terms & Condition',
      name: 'termsCondition',
      desc: '',
      args: [],
    );
  }

  /// `Verify Code`
  String get verifyCode {
    return Intl.message(
      'Verify Code',
      name: 'verifyCode',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the code we just sent to email`
  String get enterCode {
    return Intl.message(
      'Please enter the code we just sent to email',
      name: 'enterCode',
      desc: '',
      args: [],
    );
  }

  /// `example@email.com`
  String get mailExple {
    return Intl.message(
      'example@email.com',
      name: 'mailExple',
      desc: '',
      args: [],
    );
  }

  /// `Didn't receive OTP?`
  String get didReceive {
    return Intl.message(
      'Didn\'t receive OTP?',
      name: 'didReceive',
      desc: '',
      args: [],
    );
  }

  /// `Resend code`
  String get resendCode {
    return Intl.message(
      'Resend code',
      name: 'resendCode',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message(
      'Verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Your new password must be different from previously used passwords.`
  String get youNewPassword {
    return Intl.message(
      'Your new password must be different from previously used passwords.',
      name: 'youNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get ConfirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'ConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Create New Password`
  String get createNewPassword {
    return Intl.message(
      'Create New Password',
      name: 'createNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Complete Your Profile`
  String get completeYouProfile {
    return Intl.message(
      'Complete Your Profile',
      name: 'completeYouProfile',
      desc: '',
      args: [],
    );
  }

  /// `Don't worry, only you can see your personal data, No one else will be able to see it.`
  String get dontWorry {
    return Intl.message(
      'Don\'t worry, only you can see your personal data, No one else will be able to see it.',
      name: 'dontWorry',
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

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Enter Phone Number`
  String get EnterPhoneNumber {
    return Intl.message(
      'Enter Phone Number',
      name: 'EnterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Complete Profile`
  String get completeProfile {
    return Intl.message(
      'Complete Profile',
      name: 'completeProfile',
      desc: '',
      args: [],
    );
  }

  /// `Hi, `
  String get hi {
    return Intl.message(
      'Hi, ',
      name: 'hi',
      desc: '',
      args: [],
    );
  }

  /// `Let's start learning!`
  String get letStart {
    return Intl.message(
      'Let\'s start learning!',
      name: 'letStart',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `See all`
  String get seeAll {
    return Intl.message(
      'See all',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `Pupular Course`
  String get pupularCourse {
    return Intl.message(
      'Pupular Course',
      name: 'pupularCourse',
      desc: '',
      args: [],
    );
  }

  /// `Top Mentor`
  String get topMentor {
    return Intl.message(
      'Top Mentor',
      name: 'topMentor',
      desc: '',
      args: [],
    );
  }

  /// `Continue Learning`
  String get continueLearning {
    return Intl.message(
      'Continue Learning',
      name: 'continueLearning',
      desc: '',
      args: [],
    );
  }

  /// `This field must not be empty`
  String get inputValidationCanBeEmpty {
    return Intl.message(
      'This field must not be empty',
      name: 'inputValidationCanBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Password should be the same`
  String get inputValidationShouldBeSame {
    return Intl.message(
      'Password should be the same',
      name: 'inputValidationShouldBeSame',
      desc: '',
      args: [],
    );
  }

  /// `Invalid password`
  String get inputValidationInvalidPassword {
    return Intl.message(
      'Invalid password',
      name: 'inputValidationInvalidPassword',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Email`
  String get inputValidationInvalidEmail {
    return Intl.message(
      'Invalid Email',
      name: 'inputValidationInvalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `This field must be {number} characters`
  String inputValidationMustBeAtLeast(Object number) {
    return Intl.message(
      'This field must be $number characters',
      name: 'inputValidationMustBeAtLeast',
      desc: '',
      args: [number],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<I18n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<I18n> load(Locale locale) => I18n.load(locale);
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
