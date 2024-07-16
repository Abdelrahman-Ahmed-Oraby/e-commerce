import 'package:ecommerce_app/models/product_item.dart';
import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  List<ProductItem> selectedProducts = [];
  double price = 0;

  void addProduct(ProductItem product) {
    selectedProducts.add(product);
    price += product.itemPrice;
    price = double.parse(price.toStringAsFixed(2));
    notifyListeners();
  }

  void removeProduct(ProductItem product) {
    selectedProducts.remove(product);
    price -= product.itemPrice;
    price = double.parse(price.toStringAsFixed(2));
    notifyListeners();
  }

  int get productsCount {
    return selectedProducts.length;
  }
}
