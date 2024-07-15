import 'package:ecommerce_app/app_routes.dart';
import 'package:ecommerce_app/state_managment/provider/cart.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => Cart(),
      child: const EcommerceApp(),
    ),
  );
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeRoute,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
