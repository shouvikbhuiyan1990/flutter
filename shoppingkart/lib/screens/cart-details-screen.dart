import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart.dart';

class CartDetails extends StatelessWidget {
  static String routeName = '/cart-details';

  @override
  Widget build(BuildContext context) {
    final cartItemsProvider = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Details'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Your Cart Details:'),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (ctx, index) => Text('coi'),
                itemCount: cartItemsProvider.getTotalCartLength,
              ),
            )
          ],
        ),
      ),
    );
  }
}
