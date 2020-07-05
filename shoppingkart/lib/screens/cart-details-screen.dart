import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/order.dart';
import '../screens/order-details-screen.dart';
import '../widgets/cart-item.dart' as cartPage;
import '../provider/cart.dart';

class CartDetails extends StatefulWidget {
  static String routeName = '/cart-details';

  @override
  _CartDetailsState createState() => _CartDetailsState();
}

class _CartDetailsState extends State<CartDetails> {
  @override
  Widget build(BuildContext context) {
    bool _setLoader = false;
    final cartItemsProvider = Provider.of<Cart>(context);
    final orderProvider = Provider.of<Order>(context);
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
              setState(() {
                _setLoader = true;
              });
              orderProvider
                  .addOrder(
                cartItemsProvider.getTotalPrice,
                cartItemsProvider.getAllCartItemsValue,
              )
                  .then((value) {
                setState(() {
                  _setLoader = false;
                });
                cartItemsProvider.clearAll();
                Navigator.of(context)
                    .pushReplacementNamed(OrderDetails.routeName);
              });
            },
          )
        ],
      ),
      body: _setLoader
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      'Your total Cart Value is ${cartItemsProvider.getTotalPrice.toStringAsFixed(2)}'),
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
                          cartItems.keys.toList()[index]),
                      itemCount: cartItemsProvider.getTotalCartLength,
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
