import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';

import '../widgets/app-drawer.dart';
import '../provider/cart.dart';
import '../provider/productDetails.dart';
import '../provider/products.dart';
import '../screens/cart-details-screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  static String routeName = '/product-details';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final ProductItem providerPItem =
        Provider.of<ProductDetails>(context, listen: false)
            .getProductById(args['id']);

    final cartProvider = Provider.of<Cart>(context);

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(providerPItem.title),
        actions: <Widget>[
          Consumer<Cart>(
            builder: (_, cart, child) {
              return Padding(
                padding: EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      CartDetails.routeName,
                    );
                  },
                  child: Badge(
                    borderRadius: 10,
                    position: BadgePosition.topLeft(
                      top: 4,
                      left: 12,
                    ),
                    badgeContent: Text(
                      cart.getTotalCartLengthQuantity.toString(),
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                    child: Icon(Icons.shopping_cart),
                  ),
                ),
              );
            },
          )],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              child: Image.network(
                providerPItem.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    providerPItem.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    providerPItem.description,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        RaisedButton(
                          child: Text('Add to Cart'),
                          onPressed: () {
                            cartProvider.addNewCartItem(
                              providerPItem.id,
                              providerPItem.title,
                              providerPItem.price,
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
