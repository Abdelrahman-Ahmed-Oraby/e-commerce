import 'package:ecommerce_app/models/product_item.dart';
import 'package:ecommerce_app/pages/checkout_page.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/pages/details_page.dart';
import 'package:ecommerce_app/pages/home_page.dart';

import 'package:ecommerce_app/pages/login_page.dart';
import 'package:ecommerce_app/pages/register_page.dart';

class AppRoutes {
  static const String homeRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String detailsRoute = '/details';
  static const String checkOutRoute = '/checkout';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeRoute:
        return MaterialPageRoute(
          builder: (context) => const Home(),
        );

      case AppRoutes.loginRoute:
        return MaterialPageRoute(
          builder: (context) => const Login(),
        );

      case AppRoutes.registerRoute:
        return MaterialPageRoute(
          builder: (context) => const Register(),
        );
      case AppRoutes.detailsRoute:
        {
          final args = settings.arguments as ProductItem;
          return MaterialPageRoute(
            builder: (context) => Details(productItem: args),
          );
        }

      case AppRoutes.checkOutRoute:
        return MaterialPageRoute(
          builder: (context) => const CheckOut(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const Home(),
        );
    }
  }
}
