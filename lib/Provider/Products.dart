import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id, title, description, imgUrl;
  final double price, rating;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.imgUrl,
    required this.description,
    required this.rating,
    required this.price,
    this.isFavorite = false,
  });

  @override
  String toString() {
    return {
      "id": id,
      "title": title,
      "imgUrl": imgUrl,
      "description": description,
      "price": price,
      "rating": rating,
      "isFavorite": isFavorite
    }.toString();
  }

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
