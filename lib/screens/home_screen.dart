import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';
import 'package:flutter_food_delivery_ui/screens/cart_screen.dart';
import 'package:flutter_food_delivery_ui/screens/restaurant_screen.dart';
import 'package:flutter_food_delivery_ui/widgets/rating_stars.dart';
import 'package:flutter_food_delivery_ui/widgets/recent_orders.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 5),
            child: Stack(
              children: [
                IconButton(
                    iconSize: 30,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => CartScreen()));
                    },
                    icon: Icon(Icons.shopping_cart)),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      '${currentUser.cart?.length}', // Replace with the actual value of the badge
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
        leading: IconButton(
            iconSize: 30, onPressed: () {}, icon: Icon(Icons.account_circle)),
        title: Text("Food Delivery"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.symmetric(vertical: 15),
                hintText: "Search Food or Restuarant",
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {},
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:
                        BorderSide(color: Colors.deepOrangeAccent, width: 1.8)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide:
                      BorderSide(color: Colors.deepOrangeAccent, width: 1.8),
                ),
              ),
            ),
          ),
          RecentOrders(),
          SizedBox(
            height: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Nearby Restaurants",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2),
                ),
              ),
              _buildRestaurants(context),
            ],
          )
        ],
      ),
    );
  }
}

_buildRestaurants(BuildContext context) {
  List<Widget> restaurantList = [];
  restaurants.forEach((Restaurant restaurant) {
    restaurantList.add(GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => RestaurantScreen(restaurant)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
                color: Color.fromARGB(255, 232, 232, 232), width: 1)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Hero(
                tag: restaurant.imageUrl,
                child: Image(
                    height: 130,
                    width: 130,
                    fit: BoxFit.cover,
                    image: AssetImage(restaurant.imageUrl)),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant.name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    RatingStars(restaurant.rating),
                    SizedBox(
                      height: 4,
                    ),
                    Text(restaurant.address,
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w300),
                        overflow: TextOverflow.ellipsis),
                    SizedBox(
                      height: 4,
                    ),
                    Text("0.2 Miles away",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w300),
                        overflow: TextOverflow.ellipsis),
                    SizedBox(
                      height: 4,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  });

  return Column(
    children: restaurantList,
  );
}
