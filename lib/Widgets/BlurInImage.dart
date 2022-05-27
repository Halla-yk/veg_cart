import 'package:flutter/material.dart';

class BlurInImage extends StatelessWidget {
  final String url;

  const BlurInImage(this.url);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: BoxFit.cover,

        );


  }
}
