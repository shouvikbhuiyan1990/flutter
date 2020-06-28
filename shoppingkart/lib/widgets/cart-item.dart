import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart';

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
    return Consumer<Cart>(
      builder: (ctx, cart, child) {
        return Container(
          child: Dismissible(
            key: Key(subTitle.toString()),
            background: Container(
              color: Theme.of(context).errorColor,
              margin: EdgeInsets.symmetric(vertical: 10),
            ),
            onDismissed: (_) {
              cart.clearAll();
            },
            direction: DismissDirection.endToStart,
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              elevation: 5,
              child: ListTile(
                leading: CircleAvatar(
                  child: FittedBox(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        individualPrice.toString(),
                      ),
                    ),
                  ),
                ),
                title: Text(title),
                subtitle: Text(DateFormat.yMMMMEEEEd().format(subTitle)),
                trailing: Text('${quantity.toString()}X'),
              ),
            ),
          ),
        );
      },
    );
  }
}
