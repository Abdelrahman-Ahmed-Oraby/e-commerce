import 'package:ecommerce_app/app_routes.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.detailsRoute,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
