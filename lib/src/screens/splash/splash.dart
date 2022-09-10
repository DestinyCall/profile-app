import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:profile/src/screens/home/home.dart';
import 'package:profile/src/screens/login/login.dart';
import 'package:profile/src/screens/register/register.dart';

class Splash extends StatefulWidget
{
  const Splash({Key? key}) : super(key: key);
  @override
  State<Splash> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Splash> {
  static const _storage = FlutterSecureStorage();
  String? authToken;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      authToken = await _storage.read(key: 'authToken');
      if(authToken!=null)
      {
        Navigator.pushNamed(context, '/home');
      }
      else {
        Navigator.pushNamed(context, '/register');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.black,
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Colors.white54,
                  Colors.white70
                ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
                'assets/images/logo.png',
                width: 215,
                fit:BoxFit.fill
            )
          ],
        ),
      ),
    );
  }
}
