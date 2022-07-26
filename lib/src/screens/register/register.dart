//import 'dart:async';
//import 'dart:convert';
//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:profile/src/utils/const.dart' as _constants;
import 'package:profile/src/utils/validation.dart';
import 'package:profile/src/screens/login/login.dart';
import 'package:profile/src/api_controller/api_controller.dart';
import 'package:profile/src/utils/app_localization.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  @override
  State<Register> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<Register> with ValidationMixin {

  dynamic deviceHeight;
  dynamic deviceWidth;
  String? email;
  String? password;
  String? name;
  final _formKey = GlobalKey<FormState>();

  AppLocalizations? appLocalizations;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    appLocalizations = AppLocalizations.of(context);
    return SafeArea(
        child: Scaffold(
          body: LayoutBuilder(builder: (context, constraints) {
            return Container(
              height: deviceHeight * 0.9,
              width: deviceWidth,
              padding: const EdgeInsets.all(15),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: commonContent(),
              ),
            );
          }),
        )
    );
  }

  Widget commonContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Hero(tag: 'logo', child: Image.asset('assets/images/register.png', height: 100, width: deviceWidth * 0.4)),
            SizedBox(height: deviceHeight * 0.02),
            Text(
              appLocalizations?.translate('create_profile') as String,
              style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.grey.shade500),
            ),
            SizedBox(height: deviceHeight * 0.05),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.name,
                    onSaved: (value) {
                      name = value;
                    },
                    validator: (String? value) {
                      String result = ValidationMixin().validateField(value);
                      if (result != '') {
                        return 'Message';
                      }
                      else {
                        return result;
                      }
                    },
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: appLocalizations?.translate('name'),
                      hintText: appLocalizations?.translate('enter_your_name'),
                      prefixIcon: const Icon(
                        Icons.person,
                        color: _constants.iconColors,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) {
                      name = value;
                    },
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: appLocalizations?.translate('email'),
                      hintText: appLocalizations?.translate('your_email'),
                      prefixIcon: const Icon(
                        Icons.email,
                        color: _constants.iconColors,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    onSaved: (value) {
                      name = value;
                    },
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText:  appLocalizations?.translate('password'),
                      hintText: appLocalizations?.translate('set_password'),
                      prefixIcon: const Icon(
                        Icons.visibility_off,
                        color: _constants.iconColors,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: _constants.commonMargin * 2),
            Text(
              appLocalizations?.translate('already_have_account') as String,
              style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.grey.shade500, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const Login()),
                      (route) => false,
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  appLocalizations?.translate('login') as String,
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(color: _constants.primaryColor, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(height: 60),
            FloatingActionButton.extended(
              label: Text(appLocalizations?.translate('register') as String), // <-- Text
              backgroundColor: _constants.primaryColor,
              icon: const Icon(
                Icons.add,
                size: 24.0,
              ),
              onPressed: () {
                APIController.checkService();
              },
            ),
          ],
        ),
      ],
    );
  }

}