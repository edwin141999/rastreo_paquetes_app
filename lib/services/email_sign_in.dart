import 'package:firebase_auth/firebase_auth.dart';

class EmailSigninService {
  Future<bool> registerUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> signInUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> signOutUser() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }
}
