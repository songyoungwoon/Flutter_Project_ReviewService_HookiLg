import 'package:firebase_auth/firebase_auth.dart';


String? useremail = '';
bool isLogin = false;

class AuthenticationHelper {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;

  //SIGN IN METHOD
  Future signIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      isLogin = true;
      useremail = email;

      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SIGN OUT METHOD
  Future signOut() async {
    isLogin = false;
    useremail = '';
    await _auth.signOut();
  }
}