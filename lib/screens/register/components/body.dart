import 'package:flutter/material.dart';
import 'package:sampleproject/components/rounded_button.dart';
import 'package:sampleproject/components/rounded_input_field.dart';
import 'package:sampleproject/components/rounded_number_field.dart';
import 'package:sampleproject/components/rounded_password_field.dart';
import 'package:sampleproject/constants.dart';
import 'package:sampleproject/screens/home/home_screen.dart';
import 'package:sampleproject/screens/register/components/upload_buttons.dart';
import 'package:sampleproject/screens/welcome/welcome_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: size.height,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              'assets/images/newLogoCropped.png',
              height: 40,
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              "SIGN UP",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(hintText: "Full Name", onChanged: (value) {}),
            RoundedInputField(
              hintText: "Email",
              onChanged: (value) {},
              icon: Icons.email,
            ),
            RoundedNumberField(
              icon: Icons.airplane_ticket,
              hintText: "Passport Number",
              onChanged: (value) {},
            ),
            RoundedNumberField(
                hintText: "Phone Number",
                icon: Icons.phone,
                onChanged: (value) {}),
            RoundedPasswordField(onChanged: (value) {}),
            SizedBox(height: size.height * 0.02),
            Row(
              children: [
                UploadButtons(
                    description: "Passport",
                    press: () {},
                    icon: Icons.add_photo_alternate),
                UploadButtons(
                    description: "Test Result",
                    press: () {},
                    icon: Icons.post_add),
                UploadButtons(
                    description: "Vaccine Card",
                    press: () {},
                    icon: Icons.add_box),
              ],
            ),
            SizedBox(height: size.height * 0.02),
            RoundedButton(
                text: "Register", press: WelcomeScreen(), color: primaryColor),
          ]),
        ),
      ),
    );
  }
}
