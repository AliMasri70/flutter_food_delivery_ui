import 'package:flutter_food_delivery_ui/models/order.dart';

class User {
  String? name;
  List<Order>? orders;
  List<Order>? cart;

  User({
    this.name,
    this.orders,
    this.cart,
  });
}
