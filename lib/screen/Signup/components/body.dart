import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fp_review_service_hookilg/components/already_have_an_account_acheck.dart';
import 'package:fp_review_service_hookilg/components/rounded_button.dart';
import 'package:fp_review_service_hookilg/components/rounded_input_extra_field.dart';
import 'package:fp_review_service_hookilg/components/rounded_input_field.dart';
import 'package:fp_review_service_hookilg/components/rounded_password_field.dart';
import 'package:fp_review_service_hookilg/screen/Login/login_screen.dart';

class Body extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final AgeController = TextEditingController();
  final NickNameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Center (
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite, color: Colors.pink[300],),
                Text(
                  "Wellcome",
                  style: TextStyle(
                    color: Colors.pinkAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                ),
                Icon(Icons.favorite, color: Colors.pink[300],),

              ],
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              controller: emailController,
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              controller: passwordController,
              onChanged: (value) {},
            ),
            RoundedInputExtraField(
              controller: nameController,
              hintText: "Your Name",
              onChanged: (value) {},
            ),
            RoundedInputExtraField(
              controller: AgeController,
              hintText: "Your Age",
              onChanged: (value) {},
            ),
            RoundedInputExtraField(
              controller: NickNameController,
              hintText: "Your Nickname",
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {



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
