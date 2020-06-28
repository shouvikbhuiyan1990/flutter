import 'package:flutter/material.dart';

import './products.dart';

class OrderItem {
  final String orderId;
  final int orderQuantity;
  final double orderValue;
  final List<ProductItem> orderProducts;

  OrderItem({
    @required this.orderId,
    @required this.orderQuantity,
    @required this.orderValue,
    @required this.orderProducts,
  });
}

class Order extends ChangeNotifier {
  List<OrderItem> orders = [
    new OrderItem(
      orderId: DateTime.now().toString(),
      orderQuantity: 2,
      orderValue: 100.0,
      orderProducts: [
        ProductItem(
          id: 'p1',
          title: 'Red Shirt',
          description: 'A red shirt - it is pretty red!',
          price: 29.99,
          imageUrl:
              'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
        )
      ],
    )
  ];

  List<OrderItem> get getAllOrders {
    return [...orders].toList();
  }
}
