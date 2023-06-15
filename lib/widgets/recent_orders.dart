import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/order.dart';

class RecentOrders extends StatelessWidget {
  const RecentOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Recent Orders",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w600, letterSpacing: 1.2),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
            height: 120,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: 10),
                scrollDirection: Axis.horizontal,
                itemCount: currentUser.orders!.length,
                itemBuilder: (BuildContext context, int index) {
                  Order order = currentUser.orders![index];

                  return _buildRecentOrders(context, order);
                })),
      ],
    );
  }
}

_buildRecentOrders(BuildContext context, Order order) {
  return Container(
    margin: EdgeInsets.all(10),
    width: 320,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      border: Border.all(width: 1.0, color: Color.fromARGB(255, 232, 232, 232)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              image: AssetImage(order.food.imageUrl),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Spacer(),
                Text(
                  order.food.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  order.restaurant.name,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  order.date,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                ),
                // Spacer(),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 20),
          width: 48,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Theme.of(context).primaryColor),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ),
          ),
        )
      ],
    ),
  );
}
