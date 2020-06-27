import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/productDetails.dart';
import '../provider/products.dart';

class ProductDetailsScreen extends StatelessWidget {
  static String routeName = '/product-details';
  

  @override
  Widget build(BuildContext context) {
  final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
  final ProductItem providerPItem = Provider.of<ProductDetails>(context).getProductById(args['id']);

    return Scaffold(
      appBar: AppBar(
        title: Text(providerPItem.title),
      ),
    );
  }
}
