class Order {
  String id = "";
  String color = "";
  String size = "";
  int amount = 0;

  Order(this.id, this.color, this.size, this.amount);

  factory Order.from(Order order) => Order(order.id, order.color, order.size, order.amount);
}