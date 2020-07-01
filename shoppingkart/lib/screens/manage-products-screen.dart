import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app-drawer.dart';
import '../widgets/manage-product-tile.dart';
import '../provider/products.dart';
import '../provider/productDetails.dart';
import './product-edit-screen.dart';

class ManageProducts extends StatelessWidget {
  static String routeName = '/manage-products';

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductDetails>(context);
    List<ProductItem> availableItems = productProvider.getAllProduct;

    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Products'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(
                EditProduct.routeName,
              );
            },
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemBuilder: (_, index) => ManageProductTile(
                  availableItems[index].imageUrl,
                  availableItems[index].title,
                ),
                itemCount: availableItems.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
