import 'package:flutter/material.dart';

import '../widgets/product-form.dart';

class EditProduct extends StatelessWidget {
  static String routeName = '/edit-product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
      body: ProductForm(),
    );
  }
}
