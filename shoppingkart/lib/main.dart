import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './provider/productDetails.dart';
import './screens/product-details-screen.dart';
import './screens/product-listing-screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductDetails(),
      child: MaterialApp(
        title: 'Shopping Application',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => ProdctListing(),
          ProductDetailsScreen.routeName: (_) => ProductDetailsScreen()
        },
      ),
    );
  }
}
