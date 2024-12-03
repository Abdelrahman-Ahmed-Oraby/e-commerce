import 'package:ecommerce_app/app_routes.dart';
import 'package:ecommerce_app/state_managment/provider/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomCart extends StatelessWidget {
  const CustomCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<Cart>(context);

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 1),
          width: 60,
          height: 60,
          child: Stack(
            children: [
              Positioned(
                right: 3,
                bottom: 1,
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.checkOutRoute,
                    );
                  },
                  icon: const Icon(
                    Icons.add_shopping_cart,
                    size: 28,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                left: 2,
                top: 1,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(211, 164, 255, 193),
                      shape: BoxShape.circle),
                  child: Text(
                    '${productProvider.productsCount}',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16, top: 10),
          child: Text(
            "\$ ${productProvider.price}",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
