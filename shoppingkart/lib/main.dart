import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './provider/cart.dart';
import './provider/productDetails.dart';
import './provider/order.dart';
import './screens/product-details-screen.dart';
import './screens/product-listing-screen.dart';
import './screens/cart-details-screen.dart';
import './screens/order-details-screen.dart';
import './screens/manage-products-screen.dart';
import './screens/product-edit-screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductDetails()),
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProvider(create: (_) => Order()),
      ],
      child: MaterialApp(
        title: 'Shopping Application',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => ProdctListing(),
          ProductDetailsScreen.routeName: (_) => ProductDetailsScreen(),
          CartDetails.routeName: (_) => CartDetails(),
          OrderDetails.routeName: (_) => OrderDetails(),
          ManageProducts.routeName: (_) => ManageProducts(),
          EditProduct.routeName: (_) => EditProduct(),
        },
      ),
    );
  }
}
