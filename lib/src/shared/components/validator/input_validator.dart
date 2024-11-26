
import 'package:flutter/material.dart';
import 'package:millearnia/src/core/i18n/l10n.dart';
import 'package:millearnia/src/shared/utils/regexp.dart';

class InputValidator {
  static String? simpleValidator(BuildContext context, String? value) {
    if (value!.isEmpty && value == '') {
      return I18n.of(context).inputValidationCanBeEmpty;
    } else {
      return null;
    }
  }

  static String? descriptionValidator(BuildContext context, String? value) {
    if (value!.isEmpty && value == '') {
      return I18n.of(context).inputValidationCanBeEmpty;
    } else if (value.trim().length < 3) {
      return I18n.of(context).inputValidationMustBeAtLeast(3);
    } else {
      return null;
    }
  }

  static String? passwordValidator(BuildContext context, String? value) {
    if (value!.isEmpty && value == '') {
      return I18n.of(context).inputValidationCanBeEmpty;
    } else if (!RegExpApp.validateContainsDigits(value) ||
        !RegExpApp.validateSpecialCaracter(value) ||
        !RegExpApp.validateContainsUpercase(value) ||
        value.length < 8) {
      return I18n.of(context).inputValidationInvalidPassword;
    }
    return null;
  }

  static String? validateConfirmPassword(BuildContext context, String? value, String? firstPassword) {
    if (value!.isEmpty) {
      return I18n.of(context).inputValidationCanBeEmpty;
    } else if (value != firstPassword) {
      return I18n.of(context).inputValidationShouldBeSame;
    } else {
      return null;
    }
  }

  static String? emailValidator(BuildContext context, String? value) {
    if (value!.isEmpty && value == '') {
      return I18n.of(context).inputValidationCanBeEmpty;
    } else if (!RegExpApp.validateEmail(value)) {
      return I18n.of(context).inputValidationInvalidEmail;
    }
    return null;
  }
}