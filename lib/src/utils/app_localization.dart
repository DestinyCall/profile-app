import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:profile/src/utils/utils.dart';

class AppLocalizations {
  final Locale locale;
  Map<String, String>? _localizedMap;
  AppLocalizations(this.locale);
  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  Future<bool> load() async {
    Utils.prefs ??= await SharedPreferences.getInstance();
    String? languageCode = Utils.prefs?.getString('languageCode');


    /// Get the json file using the languageCode, Ex: en.json for English
    String jsonString = await rootBundle.loadString('assets/lang/${languageCode ?? 'en'}.json');

    /// Haven't set the preferred language yet, set the language from the device
    if (languageCode != null && languageCode == "hing") {
      languageCode = locale.languageCode;
      jsonString = await rootBundle.loadString('assets/lang/hing.json');
    }

    /// Creates and sets the map of the words
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedMap = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  /// Gets the string to be displayed
  String translate(String key) {
    return _localizedMap?[key]?? key;
  }
}

/// Custom localizations delegate class
class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  /// Is the language supported?
  @override
  bool isSupported(Locale locale) {
    return ['en', 'hi'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  /// Should the delegate be reloaded?
  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}
