import 'package:ecommerce_app/app_routes.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/firbese/user_auth/fiirebase_auth_services.dart';
// import 'package:ecommerce_app/firbese/user_auth/fiirebase_auth_services.dart';
import 'package:ecommerce_app/utility/utility_methods.dart';
import 'package:ecommerce_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool isLoading = false;
  late TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuthService _auth = FirebaseAuthService();

  resetPassword() async {
    Utils.showCustomDialog(context: context);
    String email = emailController.text.trim();
    await _auth.sendPasswordResetEmail(
      email: email,
      context: context,
    );
    if (!mounted) return;
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: scaffoldBackground,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          "Reset Password",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: appBarGreen,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(33.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Enter your email to reset  your password',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: screenSize.height * 0.03),
                CustomTextField(
                  errorMessage: 'Email is required',
                  emailErrorMessage: 'enter a valid email',
                  controller: emailController,
                  textInputType: TextInputType.emailAddress,
                  hintText: 'Enter Your Email',
                  suffixIcon: const Icon(Icons.email),
                ),
                SizedBox(height: screenSize.height * 0.03),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    backgroundColor: btnGreen,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await resetPassword();
                      if (_auth.isPasswordReset) {
                        Future.delayed(const Duration(seconds: 4), () {
                          Navigator.pushReplacementNamed(
                              context, AppRoutes.loginRoute);
                        });
                      }
                    } else {
                      Utils.showCustomSnackBar(
                        context: context,
                        message: 'Error⚠️...',
                      );
                    }
                  },
                  child: (isLoading)
                      ? const CircularProgressIndicator()
                      : const Text('Reset Password'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
