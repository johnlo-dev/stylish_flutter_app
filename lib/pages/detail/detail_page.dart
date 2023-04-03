import 'package:flutter/material.dart';
import 'package:flutter_project/pages/home/model/product.dart';

import '../../general_widgets/stylish_header.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          StylishHeader(hasIcBack: true),
          Text(
              style: const TextStyle(fontSize: 30),
              "${product.title} - NT\$${product.price}\n\n${product.description}\n${product.note}\n${product.texture}\n${product.place}\n${product.wash}")
        ]));
  }
}
