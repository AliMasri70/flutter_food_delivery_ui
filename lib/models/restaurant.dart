import 'package:flutter_food_delivery_ui/models/food.dart';

class Restaurant {
  String imageUrl;
  String name;
  String address;
  int rating;
  List<Food> menu;

  Restaurant({
    required this.imageUrl,
    required this.name,
    required this.address,
    required this.rating,
    required this.menu,
  });
}
