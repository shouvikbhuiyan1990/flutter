import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/products.dart';

class ProductGridItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var providerData = Provider.of<ProductItem>(context);

    return GestureDetector(
      onTap: () {},
      child: GridTile(
        child: Image.network(
          providerData.imageUrl,
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          ),
          title: Text(providerData.title),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
