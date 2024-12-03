// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_field

import 'dart:async';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/firbese/user_auth/fiirebase_auth_services.dart';
import 'package:ecommerce_app/pages/home_page.dart';
import 'package:ecommerce_app/utility/utility_methods.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    isEmailVerified = _auth.isEmailVerified();

    if (!isEmailVerified) {
      sendEmailVerification();

      timer = Timer.periodic(Duration(seconds: 3), (timer) async {
        // when we click on the link that existed on yahoo
        await _auth.reloadEmailVerification();

        // is email verified or not (clicked on the link or not) (true or false)
        setState(() {
          isEmailVerified = _auth.isEmailVerified();
          Fluttertoast.showToast(
            msg: "A verification email has been sent \n to your email",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        });

        if (isEmailVerified) {
          timer.cancel();
        }
      });
    }
  }

  sendEmailVerification() async {
    try {
      await _auth.sendEmailVerification();
      setState(() {
        canResendEmail = false;
      });

      await Future.delayed(Duration(seconds: 5));

      setState(() {
        canResendEmail = true;
      });
    } catch (e) {
      if (!mounted) return;
      Utils.showCustomSnackBar(
          context: context, message: "ERROR => ${e.toString()}");
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return isEmailVerified
        ? HomePage()
        : Scaffold(
            appBar: AppBar(
              title: Text(
                "Verify Email",
                style: TextStyle(color: Colors.white),
              ),
              elevation: 0,
              backgroundColor: appBarGreen,
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  SizedBox(height: screenSize.height * 0.01),
                  Image.asset('assets/images/logo.png'),
                  Text(
                    'Florist',
                    style: TextStyle(
                      fontSize: 40,
                      letterSpacing: 3,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Playwrite',
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.07),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          canResendEmail ? sendEmailVerification() : null;
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: btnGreen,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.all(12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "Resend New Link",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenSize.height * 0.03),
                  TextButton(
                    onPressed: () {
                      _auth.signOut();
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.blue,
                      textStyle: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: Text(
                      "Cancel",
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
