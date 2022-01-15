//library
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

//local path
import '../../constants.dart';

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
              height: MediaQuery.of(context).size.height * 0.35,
            ),
            Padding(padding: EdgeInsets.all(20)),

            // email text field
            Padding(padding: EdgeInsets.all(5)),
            Container(
              width: 300,
              height: 55,
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
              height: 55,
              padding: EdgeInsets.all(10),
              child: Center(
                child: TextField(
                  controller: _passwordController,
                  style: TextStyle(color: Colors.black),
                  //onChanged: onChanged,
                  cursorColor: kPrimaryColor,
                  decoration: _textFieldDecoration('password', Icons.password),
                ),
              ),
              decoration: _textFieldBoxDecoration(),
            ),

            // press button
            Padding(padding: EdgeInsets.all(5)),
            Container(
              child: MaterialButton(
                minWidth: 150,
                height: 50,
                color: Colors.pink[200],
                child: Text('로그인'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                onPressed: () {},
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
                  onPressed: () {},
                ),

                Padding(padding: EdgeInsets.all(1)),
                Text('/', style: _textButtonStyle(),),
                Padding(padding: EdgeInsets.all(1)),

                // sign up text button
                TextButton(
                  child: Text(
                    '회원가입',
                    style: _textButtonStyle(),
                  ),
                  onPressed: () {},
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
      ),
      hintText: hintText,
      hintStyle: _textFieldStyle(),
      border: InputBorder.none,
    );
  }

  BoxDecoration _textFieldBoxDecoration() {
    return BoxDecoration(
      color: Colors.pink[50],
      borderRadius: BorderRadius.circular(50.0),
    );
  }

  TextStyle _textFieldStyle() {
    return TextStyle(
        color: Colors.black38,
        fontWeight: FontWeight.bold,
        fontSize: 14,
        fontFamily: 'EliceDigitalBaeum');
  }

  TextStyle _textButtonStyle() {
    return TextStyle(
        color: Colors.indigo[300],
        fontWeight: FontWeight.bold,
        fontSize: 14,
        fontFamily: 'EliceDigitalBaeum');
  }


}
