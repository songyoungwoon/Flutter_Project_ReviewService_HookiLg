import 'package:cloud_firestore/cloud_firestore.dart';
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
                SizedBox(width: 8,),
                Text(
                  " Wellcome",
                  style: TextStyle(
                    color: Colors.indigo[300],
                    fontWeight: FontWeight.bold,
                    fontFamily: 'EliceDigitalBaeum',
                    fontSize: 25),
                ),
                SizedBox(width: 8,),
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
              press: () async {

                try {
                  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text
                  );
                  createuserinfo
                    (emailController.text,
                      passwordController.text,
                      nameController.text,
                      AgeController.text,
                      NickNameController.text
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen(); //메인페이지로 이동하게 변경
                      },
                    ),
                  );
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    //print('The password provided is too weak.');
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('The password provided is too weak.'),
                      duration: Duration(seconds: 2),
                      action: SnackBarAction(
                        label: 'exit',
                        onPressed: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                      ),
                    ));
                  } else if (e.code == 'email-already-in-use') {
                    //print('The account already exists for that email.');
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('The account already exists for that email.'),
                      duration: Duration(seconds: 2),
                      action: SnackBarAction(
                        label: 'exit',
                        onPressed: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                      ),
                    ));
                  }
                } catch (e) {
                  print(e);
                }
              },
            ),
            SizedBox(height: size.height * 0.01),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Route route = MaterialPageRoute(builder: (context) => LoginScreen());
                Navigator.pushReplacement(
                    context, route
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
void createuserinfo(String email, String password, String name, String age, String nickname) {
  final usercol = FirebaseFirestore.instance.collection("user_info").doc();
  usercol.set({
    "email": "$email",
    "password": "$password",
    "name": "$name",
    "age": "$age",
    "nickname": "$nickname",
    "imagePath": 'https://firebasestorage.googleapis.com/v0/b/reviewservicehookilg.appspot.com/o/profile.jpg?alt=media&token=f76f7985-5f5d-44d1-8689-f507c41558aa',

  });
}
