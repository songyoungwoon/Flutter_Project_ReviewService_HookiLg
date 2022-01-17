//library
import 'dart:ffi';

import 'package:flutter/material.dart';

//firebase
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//local path
import 'login_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _checkpasswordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _birthController = TextEditingController();
  TextEditingController _NickNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
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
                    "SIGN UP",
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

              //email text field
              Padding(padding: EdgeInsets.all(30)),
              Container(
                width: 300,
                height: 45,
                padding: EdgeInsets.all(10),
                child: Center(
                  child: TextField(
                    controller: _emailController,
                    style: TextStyle(color: Colors.black),
                    // onChanged: onChanged,
                    cursorColor: Colors.black,
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
                    cursorColor: Colors.black,
                    decoration:
                        _textFieldDecoration('password', Icons.password),
                  ),
                ),
                decoration: _textFieldBoxDecoration(),
              ),

              // check password text field
              Padding(padding: EdgeInsets.all(5)),
              Container(
                width: 300,
                height: 45,
                padding: EdgeInsets.all(10),
                child: Center(
                  child: TextField(
                    obscureText: true,
                    controller: _checkpasswordController,
                    style: TextStyle(color: Colors.black),
                    //onChanged: onChanged,
                    cursorColor: Colors.black,
                    decoration:
                        _textFieldDecoration('password check', Icons.password),
                  ),
                ),
                decoration: _textFieldBoxDecoration(),
              ),

              // name text field
              Padding(padding: EdgeInsets.all(5)),
              Container(
                width: 300,
                height: 45,
                padding: EdgeInsets.all(10),
                child: Center(
                  child: TextField(
                    controller: _nameController,
                    style: TextStyle(color: Colors.black),
                    //onChanged: onChanged,
                    cursorColor: Colors.black,
                    decoration: _textFieldDecoration(
                        'name', Icons.accessibility_new_outlined),
                  ),
                ),
                decoration: _textFieldBoxDecoration(),
              ),

              // birth text field
              Padding(padding: EdgeInsets.all(5)),
              Container(
                width: 300,
                height: 45,
                padding: EdgeInsets.all(10),
                child: Center(
                  child: TextField(
                    controller: _birthController,
                    style: TextStyle(color: Colors.black),
                    //onChanged: onChanged,
                    cursorColor: Colors.black,
                    decoration: _textFieldDecoration(
                        'birthdate to 8 word', Icons.date_range_rounded),
                  ),
                ),
                decoration: _textFieldBoxDecoration(),
              ),

              // press sign up button
              Padding(padding: EdgeInsets.all(5)),
              Container(
                child: MaterialButton(
                  minWidth: 120,
                  height: 35,
                  color: Colors.white,
                  child: Text(
                    '회원 가입',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'EliceDigitalBaeum'),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  onPressed: () async {
                    try {
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .createUserWithEmailAndPassword(
                              email: _emailController.text,
                              password: _passwordController.text);
                      createuserinfo(
                        _emailController.text,
                        _passwordController.text,
                        _nameController.text,
                        _birthController.text,
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Login();
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
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                            },
                          ),
                        ));
                      } else if (e.code == 'email-already-in-use') {
                        //print('The account already exists for that email.');
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              'The account already exists for that email.'),
                          duration: Duration(seconds: 2),
                          action: SnackBarAction(
                            label: 'exit',
                            onPressed: () {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                            },
                          ),
                        ));
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
              ),
            ],
          ),
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

// add user into firebase
void createuserinfo(
    String email, String password, String name, String birthdate) {
  final usercol =
      FirebaseFirestore.instance.collection("user_info").doc(email);
  usercol.set({
    "email": "$email",
    "password": "$password",
    "name": "$name",
    "birthdate": "$birthdate",
    "nickname": "닉네임을 설정해주세요.",
    "about": "",
    "level": 0,
    "imagePath":
        'https://firebasestorage.googleapis.com/v0/b/reviewservicehookilg.appspot.com/o/profile.jpg?alt=media&token=f76f7985-5f5d-44d1-8689-f507c41558aa',
    "backgroundimagePath":
        'https://firebasestorage.googleapis.com/v0/b/reviewservicehookilg.appspot.com/o/basicbackground.png?alt=media&token=9adb9468-2546-4a9c-82bb-99a0d92e771f',
    "follower": [''],
    "following": [''],
    "review": [''],
  });
}
