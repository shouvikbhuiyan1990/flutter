import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/cart-item.dart' as cartPage;
import '../provider/cart.dart';

class CartDetails extends StatelessWidget {
  static String routeName = '/cart-details';

  @override
  Widget build(BuildContext context) {
    final cartItemsProvider = Provider.of<Cart>(context, listen: false);
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
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Your Cart Details:'),
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
