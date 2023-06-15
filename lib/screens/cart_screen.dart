import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/order.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double total = 0;
  @override
  Widget build(BuildContext context) {
    currentUser.cart!
        .forEach((Order order) => total += order.quantity * order.food.price);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Cart (${currentUser.cart!.length})"),
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, index) {
            if (index < currentUser.cart!.length) {
              Order order = currentUser.cart![index];

              return _buildCart(order);
            } else {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Estimarted Delivery Time :"),
                        Text("25 min"),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Cost :"),
                        Text("\$${total.toStringAsFixed(2)}"),
                      ],
                    ),
                    SizedBox(
                      height: 80,
                    )
                  ],
                ),
              );
            }
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 1,
              color: Colors.grey,
            );
          },
          itemCount: currentUser.cart!.length + 1),
      bottomSheet: Container(
        height: 100,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor, shape: BoxShape.rectangle),
        child: Center(
          child: Text(
            "CHECKOUT",
            style: TextStyle(
                fontSize: 24,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ),
    );
  }

  _buildCart(Order order) {
    return Container(
      padding: EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 180,
                  height: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage(order.food.imageUrl)),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(order.food.name),
                    SizedBox(
                      height: 10,
                    ),
                    Text(order.restaurant.name),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      // height: MediaQuery.of(context).size.height * 0.045,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.remove,
                                color: Theme.of(context).primaryColor,
                              )),
                          Text(order.quantity.toString()),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add,
                                color: Theme.of(context).primaryColor,
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Text("\$ ${order.quantity * order.food.price}"),
          )
        ],
      ),
    );
  }
}
