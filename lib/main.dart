import 'dart:io';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:profile/src/api_controller/http_overrides.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:profile/src/utils/connection_info.dart';
import 'package:profile/src/app.dart';
import 'package:profile/src/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = CustomHttpOverrides();
  final packageInfo = await getPackageInfo();
  await dotenv.load(fileName: ".env");
  Utils.prefs = await SharedPreferences.getInstance();
  Utils.packageInfo = packageInfo;
  ConnectionStatusListener.getInstance().initialize();
  runApp(const Profile());
}

getPackageInfo() async {
  return await PackageInfo.fromPlatform();
}
