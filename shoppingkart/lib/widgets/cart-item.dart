import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartItem extends StatelessWidget {
  final double individualPrice;
  final String title;
  final DateTime subTitle;
  final int quantity;

  CartItem(
    this.title,
    this.subTitle,
    this.individualPrice,
    this.quantity,
  );

  @override
  Widget build(BuildContext context) {
    double totalPrice = individualPrice * quantity;

    return Container(
      child: Card(
          child: ListTile(
        leading: CircleAvatar(
          child: FittedBox(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                totalPrice.toString(),
              ),
            ),
          ),
        ),
        title: Text(title),
        subtitle: Text(DateFormat.yMMMMEEEEd().format(subTitle)),
        trailing: Text('${quantity.toString()}X'),
      )),
    );
  }
}
