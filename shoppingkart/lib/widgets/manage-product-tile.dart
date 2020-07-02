import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product-edit-screen.dart';
import '../provider/productDetails.dart';

class ManageProductTile extends StatelessWidget {
  final String productImage;
  final String productTitle;
  final String productId;

  ManageProductTile(
    this.productId,
    this.productImage,
    this.productTitle,
  );

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductDetails>(context, listen: false);

    return Card(
      child: ListTile(
        leading: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(productImage),
            ),
          ),
        ),
        title: Text(productTitle),
        trailing: Container(
          width: 100,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    EditProduct.routeName,
                    arguments: productId,
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  productProvider.deleteProductById(productId);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
