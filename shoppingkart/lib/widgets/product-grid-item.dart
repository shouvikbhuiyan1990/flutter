import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product-details-screen.dart';
import '../provider/products.dart';
import '../provider/cart.dart';

class ProductGridItem extends StatelessWidget {
  void _navigateToDetails(ctx, id) {
    Navigator.pushNamed(
      ctx,
      ProductDetailsScreen.routeName,
      arguments: <String, String>{'id': id},
    );
  }

  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<ProductItem>(context);
    final cartdata = Provider.of<Cart>(context);

    return GestureDetector(
      onTap: () => _navigateToDetails(context, providerData.id),
      child: GridTile(
        child: Image.network(
          providerData.imageUrl,
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: IconButton(
            icon: Icon(providerData.isFavourite
                ? Icons.favorite
                : Icons.favorite_border),
            onPressed: providerData.togglePreference,
          ),
          title: Text(providerData.title),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              Scaffold.of(context).hideCurrentSnackBar();
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  duration: Duration(
                    seconds: 2,
                  ),
                  content: Text('Item is added to cart'),
                  action: SnackBarAction(
                    label: 'undo',
                    onPressed: () {
                      cartdata.removeOneItem(providerData.id);
                    },
                  ),
                ),
              );
              cartdata.addNewCartItem(
                providerData.id,
                providerData.title,
                providerData.price,
              );
            },
          ),
        ),
      ),
    );
  }
}
