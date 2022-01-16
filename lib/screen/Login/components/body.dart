import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fp_review_service_hookilg/components/already_have_an_account_acheck.dart';
import 'package:fp_review_service_hookilg/components/authentication.dart';
import 'package:fp_review_service_hookilg/components/rounded_button.dart';
import 'package:fp_review_service_hookilg/components/rounded_input_field.dart';
import 'package:fp_review_service_hookilg/components/rounded_password_field.dart';
import 'package:fp_review_service_hookilg/screen/Signup/signup_screen.dart';
import 'package:fp_review_service_hookilg/screen/fristhome.dart';

import 'package:fp_review_service_hookilg/model/user_info.dart';

UserInformation my_user = UserInformation('', '', '', '', '', '');

class Body extends StatelessWidget {
  Body({
    Key? key,
  }) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.amber[300]),
                  Text(
                    "Hi, FABULOUS YOU!",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'EliceDigitalBaeum',
                        color: Colors.indigo[300]),
                  ),
                  Icon(Icons.star, color: Colors.amber[300]),
                ],
              ),
              SizedBox(height: size.height * 0.03),
              Icon(
                Icons.auto_stories,
                size: 100,
                color: Color(0xFFF06292),
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
              RoundedButton(
                text: "LOGIN",
                press: () {
                  AuthenticationHelper()
                      .signIn(
                          email: emailController.text,
                          password: passwordController.text)
                      .then((result) {
                    if (result == null) {
                      /*
                      return StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("user_info")
                              .where('email', isEqualTo: emailController.text)
                              .snapshots(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            print(1);
                            if (snapshot.hasError) {
                              return Center(
                                child: Text("firebase load fail"),
                              );
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: Text("loading"));
                            }
                            if (isLogin) {
                              my_user.setUserInfo(
                                  snapshot.data.docs[num]['imagePath'],
                                  snapshot.data.docs[num]['name'],
                                  snapshot.data.docs[num]['email'],
                                  snapshot.data.docs[num]['about'],
                                  snapshot.data.docs[num]['nickname'],
                                  snapshot.data.docs[num]['age']);
                            } else {
                              my_user.setUserInfo(
                                  'images/profile.jpg',
                                  'anonymous',
                                  '',
                                  'anonymous',
                                  'anonymous',
                                  'anonymous');
                            }
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) => FirstHome()));
                            return Container();
                              }); */
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => FirstHome()));

                    } else {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(
                          result,
                          style: TextStyle(fontSize: 16),
                        ),
                      ));
                    }
                  });
                },
              ),
              SizedBox(height: size.height * 0.01),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Route route =
                      MaterialPageRoute(builder: (context) => SignUpScreen());
                  Navigator.pushReplacement(context, route);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
