import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CartScreen.dart';

import '../Provider/Cart.dart';
import '../Widgets/AppDrawer.dart';
import '../Widgets/badge.dart';
import '../Widgets/AppLogoName.dart';
import '../Widgets/ProductList.dart';

enum Filter { All, Fav }

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppLogoName(),
        actions: [

          Consumer<Cart>(
            builder: (_, cart,child) {
              return Badge(
                child: child!,
                value: '${cart.itemCount}',
              );
            },
            child: IconButton(
              icon: const Icon(Icons.shopping_cart_outlined),
              tooltip: 'Cart',
              onPressed: () {
                Navigator.pushNamed(context, CartScreen.routeName);
              },
            ),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: ProductList(_showOnlyFavorites),
    );
  }
}
