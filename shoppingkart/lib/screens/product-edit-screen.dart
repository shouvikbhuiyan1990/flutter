import 'package:flutter/material.dart';

class EditProduct extends StatefulWidget {
  static String routeName = '/edit-product';
  EditProduct({Key key}) : super(key: key);

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
    );
  }
}
