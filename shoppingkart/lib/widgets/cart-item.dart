import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart';

class CartItem extends StatelessWidget {
  final double individualPrice;
  final String title;
  final DateTime subTitle;
  final int quantity;
  final String id;

  CartItem(
      this.title, this.subTitle, this.individualPrice, this.quantity, this.id);

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (ctx, cart, child) {
        return Container(
          child: Dismissible(
            key: UniqueKey(),
            background: Container(
              color: Theme.of(context).errorColor,
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            onDismissed: (_) {
              cart.removeOne(id);
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
