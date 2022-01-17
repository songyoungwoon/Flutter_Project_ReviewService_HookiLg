//library
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fp_review_service_hookilg/model/user_info.dart';

//firebase
import 'package:cloud_firestore/cloud_firestore.dart';

//local path
import '../../constants.dart';
import '../../screen/fristhome.dart';
import 'authentication.dart';
import 'signup_page.dart';

UserInformation user_info = UserInformation();

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //field
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // top text
            Padding(padding: EdgeInsets.fromLTRB(0, 40, 0, 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.filter_vintage_rounded,
                  color: Colors.amber[600],
                ),
                Padding(padding: EdgeInsets.all(5)),
                Text(
                  "WELCOME TO HOOKILG",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'EliceDigitalBaeum',
                      color: Colors.indigo[300]),
                ),
                Padding(padding: EdgeInsets.all(5)),
                Icon(
                  Icons.filter_vintage_rounded,
                  color: Colors.amber[500],
                ),
              ],
            ),

            // welcome image
            Padding(padding: EdgeInsets.all(30)),
            SvgPicture.asset(
              "images/icons/chat.svg",
              height: MediaQuery.of(context).size.height * 0.20,
            ),
            Padding(padding: EdgeInsets.all(10)),

            // email text field
            Padding(padding: EdgeInsets.all(5)),
            Container(
              width: 300,
              height: 45,
              padding: EdgeInsets.all(10),
              child: Center(
                child: TextField(
                  controller: _emailController,
                  style: TextStyle(color: Colors.black),
                  // onChanged: onChanged,
                  cursorColor: kPrimaryColor,
                  decoration: _textFieldDecoration('email', Icons.email),
                ),
              ),
              decoration: _textFieldBoxDecoration(),
            ),

            // password text field
            Padding(padding: EdgeInsets.all(5)),
            Container(
              width: 300,
              height: 45,
              padding: EdgeInsets.all(10),
              child: Center(
                child: TextField(
                  obscureText: true,
                  controller: _passwordController,
                  style: TextStyle(color: Colors.black),
                  //onChanged: onChanged,
                  cursorColor: kPrimaryColor,
                  decoration: _textFieldDecoration('password', Icons.password),
                ),
              ),
              decoration: _textFieldBoxDecoration(),
            ),

            // press login button
            Padding(padding: EdgeInsets.all(5)),
            Container(
              child: MaterialButton(
                minWidth: 120,
                height: 35,
                color: Colors.white,
                child: Text('로그인'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                onPressed: () {
                  AuthenticationHelper()
                      .signIn(
                          email: _emailController.text,
                          password: _passwordController.text)
                      .then((result) {
                    if (result == null) {
                      final usercol = FirebaseFirestore.instance
                          .collection("user_info")
                          .doc(_emailController.text)
                          .get()
                          .then((value) => {
                                user_info.setUserInfo(
                                    value['email'],
                                    value['name'],
                                    value['birthdate'],
                                    value['nickname'],
                                    value['about'],
                                    value['level'],
                                    value['imagePath'],
                                    value['backgroundimagePath'],
                                    value['follower'],
                                    value['following'],
                                    value['review'])
                              });

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
            ),

            // no login textbutton
            Padding(padding: EdgeInsets.all(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: Text(
                    '로그인 없이 이용하기',
                    style: _textButtonStyle(),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => FirstHome()));
                  },
                ),

                Padding(padding: EdgeInsets.all(1)),
                Text(
                  '/',
                  style: _textButtonStyle(),
                ),
                Padding(padding: EdgeInsets.all(1)),

                // sign up text button
                TextButton(
                  child: Text(
                    '회원가입',
                    style: _textButtonStyle(),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // common methods :: Decoration & Style
  InputDecoration _textFieldDecoration(hintText, icon) {
    return InputDecoration(
      icon: Icon(
        icon,
        color: Colors.amber[500],
        size: 15,
      ),
      hintText: hintText,
      hintStyle: _textFieldStyle(),
      border: InputBorder.none,
    );
  }

  BoxDecoration _textFieldBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(50.0),
    );
  }

  TextStyle _textFieldStyle() {
    return TextStyle(
        color: Colors.black38,
        fontWeight: FontWeight.bold,
        fontSize: 12,
        fontFamily: 'EliceDigitalBaeum');
  }

  TextStyle _textButtonStyle() {
    return TextStyle(
        color: Colors.indigo[300],
        fontWeight: FontWeight.bold,
        fontSize: 12,
        fontFamily: 'EliceDigitalBaeum');
  }
}
