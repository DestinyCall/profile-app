import 'package:package_info_plus/package_info_plus.dart';
class AppPackageInfo {
  Future getAppPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo;
  }
}