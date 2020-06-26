import 'package:flutter/material.dart';

import '../widgets/product-list-grid.dart';

class ProdctListing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Listing'),
      ),
      body: ProductListGrid(),
    );
  }
}
