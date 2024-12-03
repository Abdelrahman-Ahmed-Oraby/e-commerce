// ignore_for_file: unused_field, unused_local_variable

import 'package:ecommerce_app/app_routes.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/firbese/user_auth/fiirebase_auth_services.dart';
import 'package:ecommerce_app/utility/utility_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/check_widget.dart';
import '../widgets/custom_textfield.dart';

// ignore: must_be_immutable
class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isVisible = true;
  bool isLoading = false;
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  final FirebaseAuthService _auth = FirebaseAuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isPassword8Chars = false;
  bool hasDigit = false;
  bool hasUpperCase = false;
  bool hasLowerCase = false;
  bool hasSpecialCharacters = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void isPasswordCompliant(String password) {
    isPassword8Chars = false;
    hasDigit = false;
    hasUpperCase = false;
    hasLowerCase = false;
    hasSpecialCharacters = false;
    setState(() {
      if (password.contains(RegExp(r'.{8,}'))) {
        isPassword8Chars = true;
      }
      if (password.contains(RegExp(r'[0-9]'))) {
        hasDigit = true;
      }
      if (password.contains(RegExp(r'[A-Z]'))) {
        hasUpperCase = true;
      }
      if (password.contains(RegExp(r'[a-z]'))) {
        hasLowerCase = true;
      }
      if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        hasSpecialCharacters = true;
      }
    });
  }

  signUp() async {
    setState(() {
      isLoading = true;
    });

    String email = emailController.text;
    String password = passwordController.text;
    User? user = await _auth.signUpWithEmailAndPassword(
      emailAddress: email,
      password: password,
      context: context,
    );

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: scaffoldBackground,
      appBar: AppBar(
        title: const Text(
          "Register",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: appBarGreen,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 33.0, right: 33.0, top: 100.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: screenSize.height * .05),
              CustomTextField(
                errorMessage: 'Username is required',
                textInputType: TextInputType.text,
                hintText: 'Enter Your Username',
                suffixIcon: const Icon(Icons.person),
              ),
              SizedBox(height: screenSize.height * .03),
              CustomTextField(
                errorMessage: 'Email is required',
                emailErrorMessage: 'enter a valid email',
                controller: emailController,
                textInputType: TextInputType.emailAddress,
                hintText: 'Enter Your Email',
                suffixIcon: const Icon(Icons.email),
              ),
              SizedBox(height: screenSize.height * .03),
              CustomTextField(
                errorMessage: 'Password is required',
                passwordErrorMessage: 'Enter at least 8 characters',
                controller: passwordController,
                textInputType: TextInputType.visiblePassword,
                isPassword: isVisible,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  icon: (isVisible)
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                ),
                hintText: 'Enter Your Password',
                onChanged: () {
                  isPasswordCompliant(passwordController.text);
                },
              ),
              SizedBox(height: screenSize.height * .03),
              CheckWidget(
                checkTitle: 'At least 8 characters',
                isPassword8Chars: isPassword8Chars,
              ),
              CheckWidget(
                checkTitle: 'At least 1 number',
                hasDigit: hasDigit,
              ),
              CheckWidget(
                checkTitle: 'Has Uppercase',
                hasUpperCase: hasUpperCase,
              ),
              CheckWidget(
                checkTitle: 'Has Lowercase',
                hasLowerCase: hasLowerCase,
              ),
              CheckWidget(
                checkTitle: 'Has Special characters',
                hasSpecialCharacters: hasSpecialCharacters,
              ),
              SizedBox(height: screenSize.height * .01),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(12),
                  backgroundColor: btnGreen,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await signUp();
                    if (!mounted) return;
                    Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.loginRoute,
                    );
                  } else {
                    Utils.showCustomSnackBar(
                        context: context, message: 'Error⚠️');
                  }
                },
                child: (isLoading)
                    ? const CircularProgressIndicator()
                    : const Text('Register'),
              ),
              SizedBox(height: screenSize.height * .03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account! ",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, AppRoutes.loginRoute);
                    },
                    child: const Text(
                      'sign in',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(239, 3, 101, 182),
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        decorationColor: Color.fromARGB(239, 3, 101, 182),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
