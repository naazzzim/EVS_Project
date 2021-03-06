import 'package:farmerApp/Database/UserDatabase.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class AuthServices {
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  Stream<auth.User> get user {
    return _auth.authStateChanges();
  }

  Future registerWithEmailAndPassword(
      String name, String email, String password,String userType) async {
    try {
      auth.UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await UserDatabase().createUser(name, userType);
      return result.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future loginWithEmailAndPassword(String email, String password) async {
    try {
      auth.UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
