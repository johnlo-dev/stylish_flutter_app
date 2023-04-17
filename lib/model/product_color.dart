
class ProductColor {
  final String name;
  final String code;

  ProductColor(
      {required this.name,
        required this.code});

  factory ProductColor.fromJson(Map<String, dynamic> json) {
    return ProductColor(
        name: json["name"],
        code: json["code"]
    );
  }
}