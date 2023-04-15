import 'package:flutter/material.dart';


class Product {
  final int id;
  final String title;
  final String description;
  final String texture;
  final String wash;
  final String place;
  final String note;
  final String story;
  final List<String> colors;
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
        colors: ["red", "yellow", "blue"],
        sizes: ["M", "X", "XL"],
        images: [
          "https://i.pinimg.com/736x/31/2c/76/312c760b634a09f4ee188e11b58e3099.jpg",
          "https://i.pinimg.com/736x/31/2c/76/312c760b634a09f4ee188e11b58e3099.jpg",
          "https://i.pinimg.com/736x/31/2c/76/312c760b634a09f4ee188e11b58e3099.jpg"
        ],
        mainImage: json["main_image"],
        price: json["price"]
    );
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

//    var femaleUrl =
//     "https://i.pinimg.com/736x/31/2c/76/312c760b634a09f4ee188e11b58e3099.jpg";
//     var maleUrl =
//     "https://cdn1.cybassets.com/s/files/17730/theme/58399/assets/img/1630566638_c323f24b_index_block_3.jpg?1630566638";
//     var accessoryUrl =
//     "https://is2-ssl.mzstatic.com/image/thumb/Purple126/v4/32/70/36/3270360a-4e41-651e-7fdc-c7971cb9cef0/iMessage_App_Icon-0-0-1x_U007emarketing-0-0-0-0-0-3-sRGB-0-0-0-GLES2_U002c0-512MB-85-181-0-0.png/266x200bb.jpeg";
