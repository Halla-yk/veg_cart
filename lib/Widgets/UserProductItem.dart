import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/Products.dart';
import '../Screens/EditProductScreen.dart';
import '../services/firestore_services.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  Future deleteConfirmation(context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: const Text('Are you sure?'),
        content: Text('You are going to remove $title from product list.'),
        actions: [
          ElevatedButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(ctx).pop(false);
            },
          ),
          ElevatedButton(
            child: const Text('Yes'),
            onPressed: () {
              Navigator.of(ctx).pop(true);
            },
          ),
        ],
      ),
    );
  }

  UserProductItem(this.id, this.title, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [

          ],
        ),
      ),
    );
  }
}
