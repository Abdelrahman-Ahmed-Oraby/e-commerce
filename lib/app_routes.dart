import 'package:ecommerce_app/pages/details_page.dart';
import 'package:ecommerce_app/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/pages/login_page.dart';
import 'package:ecommerce_app/pages/register_page.dart';

class AppRoutes {
  static const String homeRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String detailsRoute = '/details';

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
      case AppRoutes.detailsRoute:
        return MaterialPageRoute(
          builder: (_) => const Details(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Home(),
        );
    }
  }
}
