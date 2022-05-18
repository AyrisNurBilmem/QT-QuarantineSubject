// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:sampleproject/components/rounded_button.dart';
import 'package:sampleproject/constants.dart';
import 'package:sampleproject/screens/login/login_screen.dart';
import 'package:sampleproject/screens/register/register_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // Total height and width of the screen
    return SingleChildScrollView(
      child: Container(
        height: size.height,
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/newLogo.png',
                  height: 220, fit: BoxFit.fill),
              // ignore: prefer_const_constructors
              RoundedButton(
                text: "Login",
                color: primaryColor,
                press: LoginScreen(),
              ),
              // ignore: prefer_const_constructors
              RoundedButton(
                  text: "Sign Up",
                  color: primaryLightColor,
                  textColor: Colors.black,
                  press: RegisterScreen())
            ]),
      ),
    );
  }
}
