import 'package:flutter/material.dart';

import 'package:ecommerce_app/pages/login.dart';
import 'package:ecommerce_app/pages/register.dart';

class AppRoutes {
  static const String loginRoute = '/';
  static const String registerRoute = '/register';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => const Login(),
        );

      case AppRoutes.registerRoute:
        return MaterialPageRoute(
          builder: (_) => const Register(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Login(),
        );
    }
  }
}
