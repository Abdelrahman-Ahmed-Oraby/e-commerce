import 'package:ecommerce_app/app_routes.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/models/product_item.dart';
import 'package:ecommerce_app/state_managment/provider/cart.dart';
import 'package:ecommerce_app/widgets/custom_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<Cart>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: appBarGreen,
          title: const Text(
            'Home',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Row(
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
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add_shopping_cart,
                            size: 28,
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
                            '${productProvider.selectedProducts.length}',
                            style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 0, 0, 0)),
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
            ),
          ],
        ),
        drawer: Drawer(
          shadowColor: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/nature.jpg"),
                          fit: BoxFit.cover),
                    ),
                    accountName: Text(
                      "Alison Miller",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    accountEmail: Text("alison@hotmail.com"),
                    currentAccountPictureSize: Size.square(80),
                    currentAccountPicture: CircleAvatar(
                        radius: 55,
                        backgroundImage:
                            AssetImage("assets/images/alison.jpg")),
                  ),
                  ListTile(
                      title: Text("Home"),
                      leading: Icon(Icons.home),
                      onTap: () {}),
                  ListTile(
                      title: Text("My products"),
                      leading: Icon(Icons.add_shopping_cart),
                      onTap: () {}),
                  ListTile(
                      title: Text("About"),
                      leading: Icon(Icons.help_center),
                      onTap: () {}),
                  ListTile(
                      title: Text("Logout"),
                      leading: Icon(Icons.exit_to_app),
                      onTap: () {}),
                ],
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 10),
                color: Colors.grey[200],
                margin: const EdgeInsets.only(bottom: 12),
                child: const Text(
                  "Developed by A.Oraby © 2024",
                  style: TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 22, bottom: 22),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2.1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 33,
              ),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return CustomGridItem(
                  productItem: items[index],
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.detailsRoute,
                      arguments: items[index],
                    );
                  },
                  addItem: () {
                    productProvider.addProduct(items[index]);
                  },
                );
              }),
        ),
      ),
    );
  }
}
