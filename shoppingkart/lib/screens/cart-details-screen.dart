import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/cart-item.dart' as cartPage;
import '../provider/cart.dart';

class CartDetails extends StatelessWidget {
  static String routeName = '/cart-details';

  @override
  Widget build(BuildContext context) {
    final cartItemsProvider = Provider.of<Cart>(context);
    final Map<String, CartItem> cartItems = cartItemsProvider.getAllCartItems;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Details'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Order Now',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              cartItemsProvider.clearAll();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Your total Cart Value is ${cartItemsProvider.getTotalPrice.toStringAsFixed(2)}'),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (ctx, index) => cartPage.CartItem(
                  cartItems.values.toList()[index].title,
                  DateTime.parse(cartItems.values.toList()[index].id),
                  cartItems.values.toList()[index].price,
                  cartItems.values.toList()[index].quantity,
                  cartItems.keys.toList()[index]
                ),
                itemCount: cartItemsProvider.getTotalCartLength,
              ),
            )
          ],
        ),
      ),
    );
  }
}
