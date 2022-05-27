import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/Products.dart';
import '../services/firestore_services.dart';
import 'ProductItem.dart';

class ProductList extends StatefulWidget {
  final bool showFavs;

  ProductList(this.showFavs);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> _allProducts = [];

  @override
  void initState() {
   // FirebaseFirestore.instance.collection('products').add({"name":"Hala"});
  }

  @override
  Widget build(BuildContext context) {

    List<Product>
    products = [];
    if (widget.showFavs && products.length == 0)
      return Center(
        child: Text(
          'No Favorites available\nTry adding some.',
          style: Theme
              .of(context)
              .textTheme
              .headline6,
          textAlign: TextAlign.center,
        ),
      );
    return
      StreamBuilder(
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
          //   snapshot.data.docs.map((e) {
          // products.add(Product(
          //     id: e.get('id'),
          //     title: e.get('title'),
          //     price: e.get('price'),
          //     rating: e.get('rating'),
          //     description: e.get('description'),
          //     imgUrl: e.get('imgUrl')));
          // return Text('hh');
          //   }).toList();
            // for (var doc in snapshot.data.docs) {
            //   products.add(Product(
            //           id: doc.get('id'),
            //           title: doc.get('title'),
            //           price: doc.get('price'),
            //            rating: doc.get('rating'),
            //           description: doc.get('description'),
            //           imgUrl: doc.get('imgUrl')));
            //
            //
            // }
            // _allProducts = [...products];
            // products.clear();

            //  ListView(children: snapshot.data.docs.map((e) {
            //   // _allProducts.add(Product(
            //   //     id: e.get('id'),
            //   //     title: e.get('title'),
            //   //     price: e.get('price'),
            //   //     rating: e.get('rating'),
            //   //     description: e.get('description'),
            //   //     imgUrl: e.get('imgUrl')));
            //   // print (_allProducts.toString());
            //   return ProductItem(Product(
            //       id: e.get('id'),
            //       title: e.get('title'),
            //       price: e.get('price'),
            //       rating: e.get('rating'),
            //       description: e.get('description'),
            //       imgUrl: e.get('imgUrl')));
            // }).toList(),);


         return ListView.builder(
            padding: const EdgeInsets.all(15),
            physics: BouncingScrollPhysics(),
            itemCount: _allProducts.length,
            itemBuilder: (ctx, i) {
              return
                // ChangeNotifierProvider<Product>.value(
                // value: products[i],
               // child:
              ProductItem(_allProducts[i]);
            //  );
            },
          );



          }
        });
  }

  // Widget jacketView() {
  //   Store _store;
  //   StreamBuilder<QuerySnapshot>(
  //     //عند كل تغير بال list رح ينعمل rebuild لل stream
  //     stream: _store.loadProducts(),
  //     builder: (context, snapshot) {
  //       if (snapshot.hasData) {
  //         List<Product>
  //         products; //ما بنفع تكون خارج ال stream علشان عند اي تحديث بال document list ينعمللها rebuild ع ال streamBuilder لانه لو كانت خارج ال stream رح تكمل على الموجود قبل بال list
  //         for (var doc in snapshot.data.docs) {
  //           print(doc.toString());
  //         }
  //         //loop on list of documents(rows)
  //         //ال doc عبارة عن map بتحتوي ال data
  //         //    QueryDocumentSnapshot j = doc.; //map
  //
  //         //   products.add(Product(
  //         //       id: doc.id,
  //         //       title: doc.,
  //         //       price: doc.price,
  //         //        rating: doc.rating,
  //         //       description: doc.description,
  //         //       imgUrl: doc.imgUrl));
  //         //   //بدي ارجع list of products وبدي اعبي ال attributes تبعتها من ال doc data
  //         //
  //         // }
  //         // _allProducts = [...products];
  //         // products.clear();
  //         return Text("hello");
  //       } else {
  //         return Text("loading...");
  //       }
  //     },
  //   );
  // }
}
