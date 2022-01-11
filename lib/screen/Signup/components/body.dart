import 'package:flutter/material.dart';
import 'package:fp_review_service_hookilg/components/already_have_an_account_acheck.dart';
import 'package:fp_review_service_hookilg/components/rounded_button.dart';
import 'package:fp_review_service_hookilg/components/rounded_input_extra_field.dart';
import 'package:fp_review_service_hookilg/components/rounded_input_field.dart';
import 'package:fp_review_service_hookilg/components/rounded_password_field.dart';
import 'package:fp_review_service_hookilg/screen/Login/login_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Center (
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedInputExtraField(
              hintText: "Your Name",
              onChanged: (value) {},
            ),
            RoundedInputExtraField(
              hintText: "Your Age",
              onChanged: (value) {},
            ),
            RoundedInputExtraField(
              hintText: "Your Nickname",
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ),
    );
  }
}
