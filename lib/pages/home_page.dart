import 'package:ecommerce_app/app_routes.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/firbese/user_auth/fiirebase_auth_services.dart';
import 'package:ecommerce_app/models/product_item.dart';
import 'package:ecommerce_app/state_managment/provider/cart.dart';
import 'package:ecommerce_app/widgets/app_title.dart';
import 'package:ecommerce_app/widgets/custom_cart.dart';
import 'package:ecommerce_app/widgets/custom_grid_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final FirebaseAuthService _auth = FirebaseAuthService();

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<Cart>(context);
    final User user = _auth.getUserInfo()!;
     return SafeArea(
      child: Scaffold(
        backgroundColor: scaffoldBackground,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: btnGreen,
          elevation: 50,
          title: const AppTitle(),
          centerTitle: true,
          actions: const [
            CustomCart(),
          ],
        ),
        drawer: Drawer(
          shadowColor: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                   UserAccountsDrawerHeader(
                    decoration:const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/nature.jpg"),
                          fit: BoxFit.cover),
                    ),
                    accountName:const Text(
                      "Alison Miller",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    accountEmail: Text("alison@hotmail.com"),
                    currentAccountPictureSize: Size.square(80),
                    currentAccountPicture: CircleAvatar(
                      radius: 55,
                      backgroundImage: NetworkImage('${user.photoURL}'),

                      //  AssetImage("assets/images/alison.jpg"),
                    ),
                  ),
                  ListTile(
                      title: const Text("Home"),
                      leading: const Icon(Icons.home),
                      onTap: () {}),
                  ListTile(
                      title: const Text("My products"),
                      leading: const Icon(Icons.add_shopping_cart),
                      onTap: () {}),
                  ListTile(
                      title: const Text("About"),
                      leading: const Icon(Icons.help_center),
                      onTap: () {}),
                  ListTile(
                      title: const Text("Logout"),
                      leading: const Icon(Icons.exit_to_app),
                      onTap: () {
                        _auth.signOut();
                      }),
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
