import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/productDetails.dart';
import '../provider/products.dart';

class ProductForm extends StatefulWidget {
  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _formKey = GlobalKey<FormState>();
  bool _initState = false;
  bool _setLoader = false;

  final _focusTitle = FocusNode();
  final _focusPrice = FocusNode();
  final _focusDescription = FocusNode();
  final _focusImageUrl = FocusNode();
  Map<String, String> productObject = {};
  final _imageUrlController = TextEditingController();

  void _updateImageDisplay() {
    if (!_focusImageUrl.hasFocus) {
      if ((!_imageUrlController.text.startsWith('http') &&
              !_imageUrlController.text.startsWith('https')) ||
          (!_imageUrlController.text.endsWith('.png') &&
              !_imageUrlController.text.endsWith('.jpg') &&
              !_imageUrlController.text.endsWith('.jpeg'))) {
        return;
      }
      setState(() {});
    }
  }

  @override
  void initState() {
    _imageUrlController.addListener(_updateImageDisplay);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final String id = ModalRoute.of(context).settings.arguments;
    if (!_initState) {
      if (id != null) {
        final ProductItem singleProduct =
            Provider.of<ProductDetails>(context, listen: false)
                .getProductById(id);
        productObject = {
          'id': singleProduct.id,
          'title': singleProduct.title,
          'description': singleProduct.description,
          'price': singleProduct.price.toString(),
          'imageUrl': singleProduct.imageUrl,
          'isFavourite': singleProduct.isFavourite.toString(),
        };
        _imageUrlController.text = productObject['imageUrl'];
      } else {
        productObject = {
          'title': '',
          'description': '',
          'price': '0.0',
          'imageUrl': '',
        };
      }
      _initState = true;
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _imageUrlController.removeListener(_updateImageDisplay);
    //all these focus nodes to be disposed to prevent memory leak
    _focusTitle.dispose();
    _focusPrice.dispose();
    _focusDescription.dispose();
    _focusImageUrl.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  void _saveForm() {
    final productProvider = Provider.of<ProductDetails>(context, listen: false);
    setState(() {
      _setLoader = true;
    });
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      if (productObject['id'] != null && productObject['id'].isNotEmpty) {
        setState(() {
          _setLoader = false;
        });
        final ProductItem product = ProductItem(
            id: productObject['id'],
            description: productObject['description'],
            imageUrl: productObject['imageUrl'],
            price: double.parse(productObject['price']),
            title: productObject['title'],
            isFavourite: productObject['isFavourite'] == 'true');
        productProvider.updateProductById(productObject['id'], product);
        Navigator.of(context).pop();
      } else {
        final ProductItem product = ProductItem(
          id: DateTime.now().toString(),
          description: productObject['description'],
          imageUrl: productObject['imageUrl'],
          price: double.parse(productObject['price']),
          title: productObject['title'],
        );
        productProvider.addProduct(product).catchError((errorObj) {
          return showDialog(
              context: context,
              builder: (ctx) {
                return AlertDialog(
                  title: Text('Something went Wrong'),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              });
        }).then((value) {
          setState(() {
            _setLoader = false;
          });
          Navigator.of(context).pop();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: _setLoader
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: _formKey,
              autovalidate:
                  true, //if set to false, doesnot check validation on change
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      initialValue: productObject['title'],
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
                      onSaved: (value) {
                        productObject['title'] = value;
                      },
                    ),
                    TextFormField(
                      initialValue: productObject['price'],
                      decoration: InputDecoration(
                        labelText: 'Product Price',
                      ),
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                      focusNode: _focusPrice,
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (_) => FocusScope.of(context)
                          .requestFocus(_focusDescription),
                      validator: (value) {
                        if (double.tryParse(value) == null) {
                          return 'Enter price in valid number format';
                        } else if (double.parse(value) < 0) {
                          return 'Please enter a non negetive price';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        productObject['price'] = value;
                      },
                    ),
                    TextFormField(
                      initialValue: productObject['description'],
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
                      onSaved: (value) {
                        productObject['description'] = value;
                      },
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 100,
                            height: 100,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.grey, width: 1.0),
                            ),
                            child: _imageUrlController.text.isEmpty
                                ? Text('Enter Image Url')
                                : FittedBox(
                                    child: Image.network(
                                      _imageUrlController.text,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Product Image',
                              ),
                              autocorrect: false,
                              textInputAction: TextInputAction.done,
                              controller: _imageUrlController,
                              focusNode: _focusImageUrl,
                              keyboardType: TextInputType.url,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter an image URL.';
                                }
                                if (!value.startsWith('http') &&
                                    !value.startsWith('https')) {
                                  return 'Please enter a valid URL.';
                                }
                                if (!value.endsWith('.png') &&
                                    !value.endsWith('.jpg') &&
                                    !value.endsWith('.jpeg')) {
                                  return 'Please enter a valid image URL.';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                productObject['imageUrl'] = value;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: RaisedButton(
                        child: Text('Submit'),
                        onPressed: _saveForm,
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
