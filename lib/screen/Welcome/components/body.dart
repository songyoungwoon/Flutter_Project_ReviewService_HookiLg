import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fp_review_service_hookilg/components/authentication.dart';
import 'package:fp_review_service_hookilg/components/rounded_button.dart';
import 'package:fp_review_service_hookilg/components/without_login.dart';
import 'package:fp_review_service_hookilg/screen/Login/login_screen.dart';
import 'package:fp_review_service_hookilg/screen/Signup/signup_screen.dart';
import 'package:fp_review_service_hookilg/screen/fristhome.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Container(
      child: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.filter_vintage_rounded, color: Colors.amber[600],),
                SizedBox(width: 5,),
                Text(
                  "WELCOME TO HOOKILG",
                  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'EliceDigitalBaeum',
                  color: Colors.indigo[300]),
                ),
                SizedBox(width: 5,),
                Icon(Icons.filter_vintage_rounded, color: Colors.amber[500],),

              ],
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "images/icons/chat.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "LOGIN",
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
            RoundedButton(
              text: "SIGN UP",
              color: kPrimaryLightColor,
              textColor: Colors.black54,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.0001),
            WithoutLogin(
              press: () {
                FirebaseAuth.instance.signInAnonymously();
                isLogin = false;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return FirstHome();
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
