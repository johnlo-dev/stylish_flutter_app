import 'package:flutter/material.dart';

class Product {
  int id = 0;
  String title = "";
  String description = "";
  String texture = "";
  String wash = "";
  String place = "";
  String note = "";
  String story = "";
  List<String> colors = [];
  List<String> sizes = [];
  String mainImage = "";
  List<String> images = [];
  String price = "";

  Product(
      this.id,
      this.title,
      this.description,
      this.texture,
      this.wash,
      this.place,
      this.note,
      this.story,
      this.colors,
      this.sizes,
      this.images,
      this.mainImage,
      this.price);

  factory Product.from(Product productOne) {
    return Product(
        productOne.id,
        productOne.title,
        productOne.description,
        productOne.texture,
        productOne.wash,
        productOne.place,
        productOne.note,
        productOne.story,
        productOne.colors,
        productOne.sizes,
        productOne.images,
        productOne.mainImage,
        productOne.price);
  }

  static Color parseColor(String colorString) {
    const colorRed = "red";
    const colorBlue = "blue";
    const colorYellow = "yellow";
    const colorBlack = "black";

    var color = Colors.transparent;

    switch (colorString) {
      case colorRed:
        color = Colors.red;
        break;
      case colorBlue:
        color = Colors.blue;
        break;
      case colorYellow:
        color = Colors.yellow;
        break;
      case colorBlack:
        color = Colors.black;
        break;
      default:
        color = Colors.transparent;
        break;
    }
    return color;
  }
}
