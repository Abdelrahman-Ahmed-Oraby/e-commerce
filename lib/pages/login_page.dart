import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/firbese/user_auth/fiirebase_auth_services.dart';
import 'package:ecommerce_app/state_managment/provider/google_sign_in.dart';
import 'package:ecommerce_app/utility/utility_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../app_routes.dart';
import '../widgets/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isVisible = true;

  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  final FirebaseAuthService _auth = FirebaseAuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  signIn() async {
    Utils.showCustomDialog(context: context);
    String email = emailController.text;
    String password = passwordController.text;
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
      context: context,
    );
    if (!mounted) return;
    Navigator.pop(context);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    // final googleSignInProvider = Provider.of<GoogleSignInProvider>(context);

    return Scaffold(
      backgroundColor: scaffoldBackground,
      appBar: AppBar(
        title: const Text(
          "Sign in",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: appBarGreen,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 33.0, right: 33.0, top: 160.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenSize.height * .05),
              CustomTextField(
                controller: emailController,
                textInputType: TextInputType.emailAddress,
                hintText: 'Enter Your Email',
                errorMessage: 'email is required',
                suffixIcon: const Icon(Icons.email),
              ),
              SizedBox(height: screenSize.height * .03),
              CustomTextField(
                controller: passwordController,
                textInputType: TextInputType.visiblePassword,
                isPassword: isVisible,
                hintText: 'Enter Your Password',
                errorMessage: 'password is required',
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
              ),
              SizedBox(height: screenSize.height * .03),
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
                    await signIn();
                    Navigator.pushNamed(context, AppRoutes.verifyEmailRoute);
                  }
                },
                child: const Text(' Sign In'),
              ),
              SizedBox(height: screenSize.height * .03),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.verifyEmailRoute);
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(239, 3, 101, 182),
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                    decorationColor: Color.fromARGB(239, 3, 101, 182),
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * .03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.registerRoute,
                      );
                    },
                    child: const Text(
                      'sign up',
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
              SizedBox(height: screenSize.height * .03),
              const Row(
                children: [
                  Expanded(
                      child: Divider(
                    thickness: 0.6,
                    indent: 5,
                    endIndent: 5,
                  )),
                  Text(
                    "OR",
                    style: TextStyle(),
                  ),
                  Expanded(
                      child: Divider(
                    thickness: 0.6,
                    indent: 5,
                    endIndent: 5,
                  )),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 27),
                child: GestureDetector(
                  onTap: () {
                    // googleSignInProvider.signInWithGoogle();
                    _auth.signInWithGoogle();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(13),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        // color: Colors.purple,
                        color: const Color.fromARGB(255, 200, 67, 79),
                        width: 1,
                      ),
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/google.svg",
                      height: 27,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
