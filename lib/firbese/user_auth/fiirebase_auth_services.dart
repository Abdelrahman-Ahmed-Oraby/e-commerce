// ignore_for_file: unused_local_variable, unused_field, prefer_final_fields, use_build_context_synchronously

import 'package:ecommerce_app/utility/utility_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isPasswordReset = false;

  signUpWithEmailAndPassword({
    required String emailAddress,
    required String password,
    BuildContext? context,
  }) async {
    try {
      final UserCredential credential =
          await _auth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Utils.showCustomSnackBar(
          context: context!,
          message: 'The Password provided is too weak',
        );
      } else if (e.code == 'email-already-in-use') {
        Utils.showCustomSnackBar(
          context: context!,
          message: 'The account already exists for that email.',
        );
      } else {
        Utils.showCustomSnackBar(
          context: context!,
          message: 'Error⚠️...Please try again later',
        );
      }
    } catch (e) {
      Utils.showCustomSnackBar(
        context: context!,
        message: e.toString(),
      );
    }
  }

  signInWithEmailAndPassword({
    required String email,
    required String password,
    BuildContext? context,
  }) async {
    try {
      final UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          Utils.showCustomSnackBar(
            context: context!,
            message: 'user-not-found',
          );
          break;

        case 'wrong-password':
          Utils.showCustomSnackBar(
            context: context!,
            message: 'wrong-password',
          );
          break;
        default:
          Utils.showCustomSnackBar(
            context: context!,
            message: 'Error⚠️...Please try again later',
          );
      }
      // if (e.code == 'user-not-found') {
      //   showCustomSnackBar(
      //     context: context!,
      //     message: 'user-not-found',
      //   );
      // } else if (e.code == 'wrong-password') {
      //   showCustomSnackBar(
      //     context: context!,
      //     message: 'wrong-password',
      //   );
      // }
      //  else {
      //   showCustomSnackBar(
      //     context: context!,
      //     message: 'Error⚠️...Please try again later',
      //   );
    } catch (e) {
      Utils.showCustomSnackBar(
        context: context!,
        message: e.toString(),
      );
    }
  }

  sendPasswordResetEmail({
    required String email,
    BuildContext? context,
  }) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Utils.showCustomSnackBar(
          context: context!, message: 'Done..Please check ur email');
      isPasswordReset = true;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          Utils.showCustomSnackBar(
            context: context!,
            message: 'user-not-found',
          );
          break;
        default:
          Utils.showCustomSnackBar(
            context: context!,
            message: 'Error⚠️...Please try again later',
          );
      }
      isPasswordReset = false;
    } catch (e) {
      Utils.showCustomSnackBar(
        context: context!,
        message: e.toString(),
      );
    }
  }

  signOut() async {
    _auth.signOut();
    await googleSignIn.disconnect();
  }

  bool isEmailVerified() {
    return _auth.currentUser!.emailVerified;
  }

  reloadEmailVerification() async {
    await _auth.currentUser!.reload();
  }

  sendEmailVerification() async {
    await _auth.currentUser!.sendEmailVerification();
  }

  final GoogleSignIn googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;
  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleSignIn == null) return;

    _user = googleUser;
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  User? getUserInfo() {
    final user = _auth.currentUser;
    return user;
  }
}
