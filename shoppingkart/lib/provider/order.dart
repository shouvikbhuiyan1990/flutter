import 'package:flutter/material.dart';

import './cart.dart';

class OrderItem {
  final String orderId = DateTime.now().toString();
  final DateTime orderTime;
  final double orderValue;
  final List<CartItem> orderProducts;

  OrderItem({
    @required this.orderTime,
    @required this.orderValue,
    @required this.orderProducts,
  });
}

class Order extends ChangeNotifier {
  List<OrderItem> orders = [];

  List<OrderItem> get getAllOrders {
    return [...orders].toList();
  }

  void addOrder(double orderTotal, List<CartItem> cartitems) {
    final newOrderIem = OrderItem(
      orderValue: orderTotal,
      orderTime: DateTime.now(),
      orderProducts: cartitems,
    );

    orders.add(newOrderIem);
    notifyListeners();
  }
}
