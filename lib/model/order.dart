import 'package:flutter_project/model/product.dart';

class Order {
  String id = "";
  String color = "";
  String size = "";
  int amount = 0;
  String primeResult = "";

  Order(this.id, this.color, this.size, this.amount, this.primeResult);

  factory Order.from(Order order) => Order(order.id, order.color, order.size, order.amount, order.primeResult);
}