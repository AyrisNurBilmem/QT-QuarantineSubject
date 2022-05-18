import 'package:flutter/material.dart';
import 'package:sampleproject/components/already_have_an_account_check.dart';
import 'package:sampleproject/components/rounded_button.dart';
import 'package:sampleproject/components/rounded_input_field.dart';
import 'package:sampleproject/components/rounded_password_field.dart';
import 'package:sampleproject/constants.dart';
import 'package:sampleproject/screens/home/home_screen.dart';
import 'package:sampleproject/screens/register/register_screen.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: double.infinity,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_constructors
            Image.asset(
              'assets/images/newLogoCropped.png',
            ),

            SizedBox(height: size.height * 0.07),
            Text("LOGIN", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: size.height * 0.05),
            RoundedInputField(
              hintText: "Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
                text: "Login", press: HomeScreen(), color: primaryColor),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: RegisterScreen(),
              login: true,
            )
          ],
        ));
  }
}
