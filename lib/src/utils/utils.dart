import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:profile/src/utils/const.dart';
import 'package:intl/intl.dart';

class Utils {
  static var env = dotenv.env;
  static final formatter = NumberFormat.compact(locale: 'en-US');
  static SharedPreferences? prefs;
  static PackageInfo? packageInfo;
  static var deviceInfo = <String, dynamic>{};

  static showSnackBar({String? message, GlobalKey<ScaffoldState>? scaffoldKey, SnackBarBehavior behavior = SnackBarBehavior.fixed}) {
    Get.showSnackbar(GetSnackBar(
      backgroundColor: primaryColor,
      message: message,
      margin: const EdgeInsets.only(bottom: kBottomNavigationBarHeight + 30),
      duration: const Duration(seconds: 3),
    ));
  }
}