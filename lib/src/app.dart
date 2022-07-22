import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:profile/src/provider/store.dart';
import 'package:provider/provider.dart';
import 'package:profile/src/screens/splash/splash.dart';
import 'package:profile/src/screens/home/home.dart';
import 'package:profile/src/screens/register/register.dart';
import 'package:profile/src/utils/app_localization.dart';
import 'package:profile/src/utils/const.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>(
      create: (_) => AppState(),
      child: MaterialApp(
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
        /// localization support
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'US'), // English
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var currentLocale in supportedLocales) {
            if (currentLocale.languageCode == locale?.languageCode &&
                currentLocale.countryCode == locale?.countryCode) {
              return currentLocale;
            }
          }
          return supportedLocales.first;
        },
      ),
    );
  }
}