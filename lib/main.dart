import 'package:ecommerce_app/app_routes.dart';
import 'package:ecommerce_app/pages/login_page.dart';
import 'package:ecommerce_app/pages/verify_email_page.dart';
import 'package:ecommerce_app/state_managment/provider/cart.dart';
import 'package:ecommerce_app/state_managment/provider/google_sign_in.dart';
import 'package:ecommerce_app/utility/utility_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    ChangeNotifierProvider(
      create: (context) => Cart(),
      child: const EcommerceApp(),
    ),
  );
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      title: 'Florist',
      debugShowCheckedModeBanner: false,
      // home: const VerifyEmailPage(),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            ));
          } else if (snapshot.hasError) {
            return Utils.showCustomSnackBar(
                context: context, message: "Something went wrong");
          } else if (snapshot.hasData) {
            return const VerifyEmailPage();
          } else {
            return const LoginPage();
          }
        },
      ),
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
