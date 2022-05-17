import 'package:firebase_auth/firebase_auth.dart';
import 'package:vacxpass_front/Models/appUser.dart';
import 'package:vacxpass_front/Utilities/snackBarUtil.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => FirebaseAuth.instance.currentUser;

  //create user object based on firebase user
  AppUser? _userFromFirebaseUser(User? user) {
    return user != null
        ? AppUser(uid: user.uid, emailVerified: user.emailVerified)
        : null;
  }

  // auth change user stream
  Stream<AppUser?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //sign in with email password
  Future signInEmailPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      SnackBarUtil.showSnackBar(e.message);
      print(e.toString());
      return null;
    }
  }

  // Register with email password
  Future regEmailPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      SnackBarUtil.showSnackBar(e.message);
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      SnackBarUtil.showSnackBar(e.message);
      print(e.message);
      return null;
    }
  }

  //send verification link to email
  Future sendVerificationEmail() async {
    try {
      final user = _auth.currentUser!;
      await user.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      SnackBarUtil.showSnackBar(e.message);
      print(e.message);
    }
  }

  Future reloadUser() async {
    try {
      return await _auth.currentUser!.reload();
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return;
    }
  }

  Future sendPasswordResetEmail(String? email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email!);
      if (_auth.currentUser != null) signOut();
      return true;
    } on FirebaseAuthException catch (e) {
      SnackBarUtil.showSnackBar(e.message);
      print(e.message);
      return false;
    }
  }
  // sign in anon
  // Future signInAnon() async {
  //   try {
  //     UserCredential result = await _auth.signInAnonymously();
  //     User? user = result.user;
  //     return _userFromFirebaseUser(user);
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }
}
