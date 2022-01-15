//library
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

//local path
import 'authentication.dart';
import '../screen/fristhome.dart';

class WithoutLogin extends StatelessWidget {
  bool login = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
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
          child: Text(
            "use wiithout an account.",
            style: TextStyle(
                color: Colors.amber[600],
                fontWeight: FontWeight.bold,
                fontFamily: 'EliceDigitalBaeum'),
          ),
        ),
      ],
    );
  }
}
