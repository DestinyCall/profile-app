import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:profile/src/utils/connection_info.dart';
import 'package:profile/src/utils/const.dart';
import 'package:profile/src/utils/utils.dart';

class ConnectionEmptyState extends StatefulWidget {
  const ConnectionEmptyState({Key? key}) : super(key: key);
  @override
  _ConnectionEmptyStateState createState() => _ConnectionEmptyStateState();
}

class _ConnectionEmptyStateState extends State<ConnectionEmptyState> {
  DateTime currentBackPressTime = DateTime.now();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        return onBackPressed();
      },
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: bgColor,
        body: Align(
          child: Column(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SvgPicture.asset('assets/icons/nointernet.svg'),
                ),
              ),
              const SizedBox(height: commonMargin * 5),
              Expanded(
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'We are offline !!',
                        style: Theme.of(context).textTheme.headline4?.copyWith(color: primaryColor, fontWeight: FontWeight.w500),
                        children: const [
                          TextSpan(
                            text: 'Check the internet connection',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      width: size.width * 0.6,
                      margin: const EdgeInsets.only(top: commonMargin * 3),
                      child: Text(
                        'We are not being able to communicate with our backend servers currently',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// handle back press
  Future<bool> onBackPressed() async {
    ConnectionStatusListener instance = ConnectionStatusListener.getInstance();
    bool result = await instance.checkConnection();
    if (result) {
      return true;
    }

    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) >= const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Utils.showSnackBar(message: 'Tap Again to Exit', scaffoldKey: _scaffoldKey);
    } else {
      SystemNavigator.pop(animated: true);
    }
    return Future.value(false);
  }
}
