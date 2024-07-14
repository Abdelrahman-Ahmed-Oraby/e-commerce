import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter/material.dart';

import '../app_routes.dart';
import '../widgets/custom_textfield.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(33.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenSize.height * .05),
              const CustomTextField(
                textInputType: TextInputType.emailAddress,
                isPassword: false,
                hintText: 'Enter Your Email',
              ),
              SizedBox(height: screenSize.height * .03),
              const CustomTextField(
                textInputType: TextInputType.visiblePassword,
                isPassword: true,
                hintText: 'Enter Your Password',
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
                onPressed: () {},
                child: const Text(' Sign In'),
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
                     Navigator.pushReplacementNamed(context, AppRoutes.registerRoute);},
                    child: const Text(
                      'sign up',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
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
