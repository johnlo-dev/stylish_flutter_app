import 'package:flutter/material.dart';
import 'package:flutter_project/model/product_color.dart';

class Product {
  final int id;
  final String title;
  final String description;
  final String texture;
  final String wash;
  final String place;
  final String note;
  final String story;
  final List<ProductColor> colors;
  final List<String> sizes;
  final String mainImage;
  final List<String> images;
  final int price;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.texture,
      required this.wash,
      required this.place,
      required this.note,
      required this.story,
      required this.colors,
      required this.sizes,
      required this.images,
      required this.mainImage,
      required this.price});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        texture: json["texture"],
        wash: json["wash"],
        place: json["place"],
        note: json["note"],
        story: json["story"],
        colors: (json["colors"] as List<dynamic>)
            .map((color) => ProductColor.fromJson(color))
            .toList(),
        sizes: (json["sizes"] as List<dynamic>)
            .map((size) => size.toString())
            .toList(),
        images: (json["images"] as List<dynamic>)
            .map((size) => size.toString())
            .toList(),
        mainImage: json["main_image"],
        price: json["price"]);
  }

  static Color parseColor(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
