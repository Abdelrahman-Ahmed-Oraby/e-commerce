import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/state_managment/provider/cart.dart';
import 'package:ecommerce_app/widgets/custom_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<Cart>(context);

    return Scaffold(
      backgroundColor: scaffoldBackground,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: appBarGreen,
        title: const Text(
          'Product Checkout',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          CustomCart(),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: productProvider.productsCount,
              itemBuilder: (BuildContext context, int index) => Card(
                child: ListTile(
                  title:
                      Text(productProvider.selectedProducts[index].itemTitle),
                  subtitle: Text(
                    '\$ ${productProvider.selectedProducts[index].itemPrice} ${productProvider.selectedProducts[index].location} ',
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                        productProvider.selectedProducts[index].itemImg),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      productProvider.removeProduct(
                          productProvider.selectedProducts[index]);
                    },
                    icon: const Icon(
                      Icons.remove_circle_outline_outlined,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: btnPink,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w800)),
              onPressed: () {},
              child: Text('Pay \$ ${productProvider.price}'),
            ),
          ),
        ],
      ),
    );
  }
}
