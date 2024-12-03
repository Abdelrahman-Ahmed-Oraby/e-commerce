// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class GoogleSignInProvider with ChangeNotifier {
//   final GoogleSignIn googleSignIn = GoogleSignIn();

//   GoogleSignInAccount? _user;

//   GoogleSignInAccount get user => _user!;

//   signInWithGoogle() async {
//     final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

//     if (googleSignIn == null) return;

//     _user = googleUser;
//     final GoogleSignInAuthentication? googleAuth =
//         await googleUser?.authentication;
//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth?.accessToken,
//       idToken: googleAuth?.idToken,
//     );
//     await FirebaseAuth.instance.signInWithCredential(credential);
//     notifyListeners();
//   }
// }
