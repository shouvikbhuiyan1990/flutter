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
    final ProductItem providerPItem =
        Provider.of<ProductDetails>(context, listen: false)
            .getProductById(args['id']);

    return Scaffold(
      appBar: AppBar(
        title: Text(providerPItem.title),
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
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
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
                  RaisedButton(
                    child: Text('Add to Cart'),
                    onPressed: () {},
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
