import 'package:ecommerce_app/models/product_item.dart';
import 'package:flutter/material.dart';

class CustomGridItem extends StatelessWidget {
  final ProductItem productItem;
  final Function onPressed;
  final Function addItem;
  const CustomGridItem({
    super.key,
    required this.productItem,
    required this.onPressed,
    required this.addItem,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Stack(
        children: [
          Positioned(
            bottom: -9,
            top: -3,
            right: 0,
            left: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(55),
              child: Image.asset(productItem.itemImg),
            ),
          ),
          Positioned(
            bottom: 1,
            right: 15,
            left: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$ ${productItem.itemPrice}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                IconButton(
                  color: const Color.fromARGB(255, 62, 94, 70),
                  onPressed: () {
                    addItem();
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 26,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
