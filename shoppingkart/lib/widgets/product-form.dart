import 'package:flutter/material.dart';

class ProductForm extends StatefulWidget {
  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _formKey = GlobalKey<FormState>();

  final _focusTitle = FocusNode();
  final _focusPrice = FocusNode();
  final _focusDescription = FocusNode();

  @override
  void dispose() {
    //all these focus nodes to be disposed to prevent memory leak
    _focusTitle.dispose();
    _focusPrice.dispose();
    _focusDescription.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Product Title',
                ),
                autocorrect: false,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_focusPrice),
                focusNode: _focusTitle,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a valid title';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Product Price',
                ),
                autocorrect: false,
                textInputAction: TextInputAction.next,
                focusNode: _focusPrice,
                keyboardType: TextInputType.number,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_focusDescription),
                validator: (value) {
                  if (double.tryParse(value) == null) {
                    return 'Enter price in valid number format';
                  } else if (double.parse(value) < 0) {
                    return 'Please enter a non negetive price';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Product Description',
                ),
                autocorrect: false,
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: _focusDescription,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a valid description';
                  }
                  if (value.length < 10) {
                    return 'Description should be of 10 charecters atleast';
                  }
                  return null;
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
