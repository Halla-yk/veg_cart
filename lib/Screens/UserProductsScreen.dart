import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/Products.dart';
import '../Widgets/AppDrawer.dart';
import '../Widgets/UserProductItem.dart';
import '../Widgets/AppLogoName.dart';
import 'EditProductScreen.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-product';
  List<Product> _allProducts = [];
  @override
  Widget build(BuildContext context) {
  //  final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const AppLogoName(
          firstName: 'Your',
          lastName: 'Products',
        ),
        actions: [
          TextButton(
            child: Text(
              'Add',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            onPressed: () {
              Navigator.pushNamed(context, EditProductScreen.routeName);
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('products').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if(!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              else{
                List<Product>
                products = [];
                for (var e in snapshot.data!.docs) {
                  products.add(Product(
                      id: e.get('id'),
                      title: e.get('title'),
                      price: e.get('price'),
                      rating: e.get('rating'),
                      description: e.get('description'),
                      imgUrl: e.get('imgUrl')));
                }
                print(products.toString());
                _allProducts = [...products];
                products.clear();

                return ListView.builder(
                      itemBuilder: (_, index) => Column(
                        children: [
                          UserProductItem(
                            _allProducts[index].id,
                            _allProducts[index].title,
                            _allProducts[index].imgUrl,
                          ),
                          Divider(),
                        ],
                      ),
                      itemCount: _allProducts.length,
                    );



              }
            })
        //
      ),
    );
  }
}
