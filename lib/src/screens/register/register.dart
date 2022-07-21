import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:profile/src/utils/const.dart' as _constants;
import 'package:profile/src/utils/validation.dart';
import 'package:profile/src/screens/login/login.dart';
import 'package:profile/src/api_controller/api_controller.dart';

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
  final _formKey1 = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;

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
            Hero(tag: 'logo', child: Image.asset('assets/images/logo.png', height: 100, width: deviceWidth * 0.4)),
            SizedBox(height: deviceHeight * 0.02),
            Text(
              'Create Candidate Profile',
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
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name *',
                      hintText: 'Enter your name',
                      prefixIcon: Icon(
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
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email *',
                      hintText: 'Your email address',
                      prefixIcon: Icon(
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
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password *',
                      prefixIcon: Icon(
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
              'Already have account',
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
                  'Login',
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(color: _constants.primaryColor, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(height: 60),
            FloatingActionButton.extended(
              label: const Text('Register'), // <-- Text
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