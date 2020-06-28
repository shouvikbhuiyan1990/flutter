import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../provider/cart.dart';

class OrderItem extends StatelessWidget {
  final DateTime orderTime;
  final double orderValue;
  final List<CartItem> orderedProducts;

  OrderItem(
    this.orderValue,
    this.orderTime,
    this.orderedProducts,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ExpansionTile(
        title: Text('Total Ordered Value $orderValue'),
        leading: Icon(Icons.toys),
        children: <Widget>[
          Text(
            'Ordered On ${DateFormat.yMMMMEEEEd().format(orderTime)}',
            style: TextStyle(
              fontSize: 12,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.left,
            softWrap: true,
          ),
          ...orderedProducts.map((e) => Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[Text(e.title), Text('${e.quantity}X')],
                ),
              ))
        ],
      ),
    );
  }
}
