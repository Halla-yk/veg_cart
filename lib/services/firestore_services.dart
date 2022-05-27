import 'package:cloud_firestore/cloud_firestore.dart';

import '../Provider/Products.dart';

class Store {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static addProduct(Product product) {
    firestore.collection("products").add({
      "title": product.title,
      "description": product.description,
      "price": product.price,
      "imgUrl": product.imgUrl,
      "id": DateTime.now().toIso8601String(),
      "rating": 4.0,
    });
  }

  Stream<QuerySnapshot> loadProducts() {
    return firestore.collection("products").snapshots();
  }

  // Stream<QuerySnapshot> loadOrders() {
  //   return _firestore.collection(kOrders).snapshots();
  // }
  //
  // Stream<QuerySnapshot> loadOrderDetails(documentId) {
  //   return _firestore
  //       .collection(kOrders)
  //       .document(documentId)
  //       .collection(kOrderDetails)
  //       .snapshots();
  // }
  //
  static Future<void> deleteProduct(documentId) async {
    await firestore.collection("products").doc(documentId).delete();

  }
//
// editProduct(data, documentId) {
//   _firestore
//       .collection(kProductsCollection)
//       .document(documentId)
//       .updateData(data);
// }
//
// storeOrders(data, List<Product> products) {
//   var documentRef = _firestore.collection(kOrders).document();
//   documentRef.setData(data);
//   for (var product in products) {
//     documentRef.collection(kOrderDetails).document().setData({
//       kProductName: product.pName,
//       kProductPrice: product.pPrice,
//       kProductQuantity: product.pQuantity,
//       kProductLocation: product.pLocation,
//       kProductCategory: product.pCategory
//     });
//   }
//}
}
