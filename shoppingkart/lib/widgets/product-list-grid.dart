import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/productDetails.dart';
import './product-grid-item.dart';

class ProductListGrid extends StatelessWidget {
  final bool isOnlyfavourites;

  ProductListGrid(this.isOnlyfavourites);

  @override
  Widget build(BuildContext context) {
    final providerdata = Provider.of<ProductDetails>(context);
    final loadedProducts = isOnlyfavourites ? providerdata.getFavouriteProducts : providerdata.getAllProduct;

    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 15),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, index) {
          return ChangeNotifierProvider.value(
            //creating a provider here because we need dynamic product item info like isfavourite
            //just another way of creating providers. Useful when scrolling list. Otherwise flutter automatically dispose
            //and that creates error like trying to access already disposed provider
            builder: (_, index) => ProductGridItem(),
            value: loadedProducts[index],
          );
        },
        itemCount: loadedProducts.length,
      ),
    );
  }
}
