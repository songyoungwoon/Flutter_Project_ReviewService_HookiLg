import 'package:flutter/material.dart';
import 'package:fp_review_service_hookilg/components/already_have_an_account_acheck.dart';
import 'package:fp_review_service_hookilg/components/rounded_button.dart';
import 'package:fp_review_service_hookilg/components/rounded_input_field.dart';
import 'package:fp_review_service_hookilg/components/rounded_password_field.dart';
import 'package:fp_review_service_hookilg/screen/Signup/signup_screen.dart';
import 'package:fp_review_service_hookilg/screen/fristhome.dart';

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
                  Icon(Icons.star,color:Colors.amber[300]),
                  Text(
                    "Hi, FABULOUS YOU!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'EliceDigitalBaeum',
                      color:Colors.indigo[300] ),
                  ),
                  Icon(Icons.star,color:Colors.amber[300]),

                ],
              ),
              SizedBox(height: size.height * 0.03),
              Icon(Icons.auto_stories, size: 100, color: Colors.pinkAccent,),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return FirstHome(); //메인페이지로 이동하게 변경
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
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
            ],
          ),
        ),
      ),
    );
  }
}