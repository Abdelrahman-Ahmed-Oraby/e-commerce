import 'package:ecommerce_app/pages/home.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/pages/login.dart';
import 'package:ecommerce_app/pages/register.dart';

class AppRoutes {
  static const String homeRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => const Home(),
        );

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
          builder: (_) => const Home(),
        );
    }
  }
}
