import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  Future<void> addOrder(double orderTotal, List<CartItem> cartitems) async {
    try {
      await http.post(
        'https://flutter-firebase-4e47a.firebaseio.com/orders.json',
        body: json.encode({
          'orderValue': orderTotal,
          'orderTime': DateTime.now().toString(),
          'orderProducts': cartitems.map((elem) {
            return {
              'id': elem.id,
              'quantity': elem.quantity,
              'price': elem.price,
              'title': elem.title,
            };
          }).toList(),
        }),
      );
      final newOrderIem = OrderItem(
        orderValue: orderTotal,
        orderTime: DateTime.now(),
        orderProducts: cartitems,
      );

      orders.add(newOrderIem);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
