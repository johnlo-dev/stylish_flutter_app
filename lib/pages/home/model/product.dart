
class Product {
  int id = 0;
  String title = "";
  String description = "";
  String texture = "";
  String wash = "";
  String place = "";
  String note = "";
  String story = "";
  List colors = [];
  List sizes = [];
  String mainImage = "";
  List images = [];
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

  factory Product.from(Product productOne){
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
        productOne.price
    );
  }
}