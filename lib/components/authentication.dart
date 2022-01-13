import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fp_review_service_hookilg/utils/user_preferences.dart';


String? useremail = '';

class AuthenticationHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;

  //SIGN IN METHOD
  Future signIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      useremail = FirebaseAuth.instance.currentUser!.email;



      // StreamBuilder(
      //   stream: FirebaseFirestore.instance
      //       .collection('user_info')
      //       .where("email", isEqualTo: useremail)
      //       .snapshots(),
      //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      //
      //     return Container(
      //         UserPreferences(snapshot.data['name']);
      //     );
      // },
      //
      // );


      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SIGN OUT METHOD
  Future signOut() async {
    await _auth.signOut();

    print('signout');
  }
}