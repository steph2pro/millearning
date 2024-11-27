import 'dart:io';

import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:millearnia/src/core/i18n/l10n.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';

final RegExp emailMatchRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final RegExp phoneNumberRegex = RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]');
final RegExp passwordRegex = RegExp(r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$');

const double minimalRequestAmount = 10;
const int maxSupportVideoSize = 10000000; // approx. 10 Mo

void showLoadingBarrier(BuildContext context) {
  showDialog(
    context: context,
    useRootNavigator: true,
    builder: (_) {
      return PopScope(
        canPop: false,
        child: Align(
          alignment: Alignment.center,
          child: GestureDetector(
            onLongPress: () {
              Navigator.of(context).pop();
            },
            child: Container(
              alignment: Alignment.center,
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const CircularProgressIndicator(),
            ),
          ),
        ),
      );
    },
  );
}

String isoToEmoji(String code) {
  return code.split('').map((letter) => String.fromCharCode(letter.codeUnitAt(0) % 32 + 0x1F1E5)).join('');
}

List<String> get _countriesList => [
      "CM",
      "BE",
      "BG",
      "CZ",
      "DK",
      "DE",
      "EE",
      "IE",
      "GR",
      "ES",
      "FR",
      "HR",
      "IT",
      "CY",
      "LV",
      "LT",
      "LU",
      "HU",
      "MT",
      "NL",
      "AT",
      "PL",
      "PT",
      "RO",
      "SI",
      "SK",
      "FI",
      "SE",
      "IS",
      "LI",
      "NO",
      "CH",
      "GB",
      "US",
      "CA",
      "JP"
    ];

void showCountryPicker(BuildContext context, {bool limitedList = true, required ValueChanged<Country> onValuePicked}) {
  showDialog(
      context: context,
      builder: (_) {
        return CountryPickerDialog(
          isSearchable: true,
          searchInputDecoration: InputDecoration(hintText: I18n.of(context).search, hintStyle: context.textTheme.bodySmall),
          priorityList: [
            if (const String.fromEnvironment('env') == 'test') CountryPickerUtils.getCountryByIsoCode('cm'),
          ],
          itemFilter: (c) {
            if (limitedList) {
              return _countriesList.contains(c.isoCode);
            }
            return true;
          },
          onValuePicked: onValuePicked,
          title: Text(I18n.of(context).country),
          itemBuilder: (c) => ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              backgroundImage: AssetImage(CountryPickerUtils.getFlagImageAssetPath(c.isoCode), package: 'country_pickers'),
            ),
            title: Text('+${c.phoneCode} ${c.name}'),
          ),
        );
      });
}

void showDateTimePicker(BuildContext context, {DateTime? initialDate, required ValueChanged<DateTime> onValuePicked}) {
  showDatePicker(
    context: context,
    initialDate: initialDate ?? DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime.now(),
  ).then((date) {
    if (date != null) {
      onValuePicked(date);
    }
  });
}

String sizeToString(int size) {
  double ko = size / 1000;
  if (ko >= 1000) {
    double mo = ko / 1000;
    if (mo >= 1000) {
      double go = mo / 1000;
      return '${go.toStringAsFixed(2)} Go';
    } else {
      return '${mo.toStringAsFixed(2)} Mo';
    }
  } else {
    return '${ko.toStringAsFixed(2)} Ko';
  }
}

Widget listTileBuilder(BuildContext context, String text, {IconData? icon, VoidCallback? onTap, Color? color}) {
  return ListTile(
    onTap: onTap,
    leading: DecoratedBox(
      decoration: BoxDecoration(color: color ?? Theme.of(context).scaffoldBackgroundColor, borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Icon(
          icon,
          color: Colors.white,
          size: 18.0,
        ),
      ),
    ),
    title: Text(
      text,
      //style: CupertinoTheme.of(context).textTheme.textStyle,
    ),
    trailing: const Icon(Icons.chevron_right),
    dense: true,
  );
}

List<TextInputFormatter> mobileFormatters(String text, countryCode, {int? subscringLength}) {
  final country = CountryWithPhoneCode.getCountryDataByPhone(countryCode + text);

  if (country == null) {
    return [
      FilteringTextInputFormatter.digitsOnly,
    ];
  }

  return [
    FilteringTextInputFormatter.digitsOnly,
    LibPhonenumberTextFormatter(
      country: country,
    )
  ];
}

enum IndicatorStatus {
  // initialisation
  none,
  // chargement des données et la liste actuelle est vide
  loadingMore,
  // liste actuelle vide
  empty,
  // liste non vide
  available,
  // liste non vide et chargement des données
  availableLoadingMore,
  // erreur
  error,
  // liste non vide et erreur
  availableError,
  // plus rien à charger
  noMoreLoad
}

/// Checks if the given string is an address
///
/// @method isAddress
/// @param {String} address the given HEX adress
/// @return {Boolean}
/// from https://ethereum.stackexchange.com/a/1379
bool isEthAddress(String address) {
  if (!RegExp(r"/^(0x)?[0-9a-f]{40}").hasMatch(address)) {
    return false;
  } else if (RegExp(r"/^(0x)?[0-9a-f]{40}").hasMatch(address) || RegExp(r"/^(0x)?[0-9A-F]{40}").hasMatch(address)) {
    return true;
  } else {
    return false;
  }
}