import 'package:flutter/material.dart';
import 'package:profile/src/screens/splash/splash.dart';
import 'package:profile/src/screens/home/home.dart';
import 'package:profile/src/screens/register/register.dart';
import 'package:profile/src/utils/const.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lato',
        primarySwatch: primarySwatch,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/':(context ) => const Splash(),
        '/home':(context ) => const Home(),
        '/register':(context ) => const Register()
      },
    );
  }
}