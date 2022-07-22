import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

typedef ValueCallback = Function<T>(T);
const langMap = {'en': 'English', 'hi': 'हिन्दी'};

// api module
var env = dotenv.env;
var apiUrl = env['BASE_URL'];

//API Endpoints
var serviceUri = apiUrl;

// colors
const Color subtextColor = Color(0xff867979);
const Color primaryColor = Color(0xff343d46);
const Color shadowColor = Color(0xffdcdcdc);
const Color bgColor = Color(0xffF6F6F6);
const Color textColor = Color(0xff4a4a4a);
const onBoardingBgColor = Color(0xffF6C557);
const congratsBgColor = Color(0xff00A9A3);
const darkPrimaryColor = Color(0xff007E7A);
const iconColors = Color(0xff3b5998);

const MaterialColor primarySwatch = MaterialColor(0xff2b7a78, primaryColorMap);
const Map<int, Color> primaryColorMap = {
  50: Color.fromRGBO(43, 122, 120, .1),
  100: Color.fromRGBO(43, 122, 120, .2),
  200: Color.fromRGBO(43, 122, 120, .3),
  300: Color.fromRGBO(43, 122, 120, .4),
  400: Color.fromRGBO(43, 122, 120, .5),
  500: Color.fromRGBO(43, 122, 120, .6),
  600: Color.fromRGBO(43, 122, 120, .7),
  700: Color.fromRGBO(43, 122, 120, .8),
  800: Color.fromRGBO(43, 122, 120, .9),
  900: Color.fromRGBO(43, 122, 120, 1),
};

const double commonMargin = 10.0;
const BoxShadow commonShadow = BoxShadow(
  color: shadowColor,
  spreadRadius: 1.5,
  blurRadius: 2,
  offset: Offset(0, 0),
);
