import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './products.dart';

class ProductDetails extends ChangeNotifier {
  List<ProductItem> prodcutList = [
    // ProductItem(
    //   id: 'p1',
    //   title: 'Red Shirt',
    //   description: 'A red shirt - it is pretty red!',
    //   price: 29.99,
    //   imageUrl:
    //       'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    // ),
    // ProductItem(
    //   id: 'p2',
    //   title: 'Trousers',
    //   description: 'A nice pair of trousers.',
    //   price: 59.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    // ),
    // ProductItem(
    //   id: 'p3',
    //   title: 'Yellow Scarf',
    //   description: 'Warm and cozy - exactly what you need for the winter.',
    //   price: 19.99,
    //   imageUrl:
    //       'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    // ),
    // ProductItem(
    //   id: 'p4',
    //   title: 'A Pan',
    //   description: 'Prepare any meal you want.',
    //   price: 49.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    // ),
  ];

  Future<void> get getAllProductsApi async {
    final response = await http
        .get('https://flutter-firebase-4e47a.firebaseio.com/products.json');

    final Map<String, dynamic> responseBody = json.decode(response.body);
    prodcutList.length = 0;
    responseBody.forEach((productId, product) {
      prodcutList.add(ProductItem(
          id: productId,
          description: product['description'],
          title: product['title'],
          price: product['price'],
          imageUrl: product['imageUrl'],
          isFavourite: product['isFavourite'] == true));
    });

    notifyListeners();
  }

  List<ProductItem> get getAllProduct {
    return [...prodcutList];
  }

  List<ProductItem> get getFavouriteProducts {
    return prodcutList
        .where(
          (element) => element.isFavourite,
        )
        .toList();
  }

  Future<void> addProduct(value) async {
    //async returns the await future type by default
    try {
      final response = await http.post(
        'https://flutter-firebase-4e47a.firebaseio.com/products.json',
        body: json.encode({
          'title': value.title,
          'description': value.description,
          'price': value.price,
          'imageUrl': value.imageUrl,
        }),
      );

      prodcutList.add(ProductItem(
        id: json.decode(response.body)['name'],
        title: value.title,
        description: value.description,
        price: value.price,
        imageUrl: value.imageUrl,
      ));

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  ProductItem getProductById(pid) {
    return prodcutList.singleWhere(
      (element) => element.id == pid,
    );
  }

  void deleteProductById(productId) {
    prodcutList.removeWhere((element) => element.id == productId);

    notifyListeners();
  }

  Future<void> updateProductByIdApi(pid, value) async {
    final url =
        'https://flutter-firebase-4e47a.firebaseio.com/products$pid.json';
    try {
      await http.patch(
        url,
        body: json.encode({
          'title': value.title,
          'description': value.description,
          'price': value.price,
          'imageUrl': value.imageUrl,
        }),
      );

      final int singleProductIndex =
          prodcutList.indexWhere((element) => element.id == pid);
      prodcutList[singleProductIndex] = value;

      notifyListeners();
    } catch (e) {
      throw (e);
    }
  }

  // update product without api integration
  void updateProductById(pid, newProduct) {
    final int singleProductIndex =
        prodcutList.indexWhere((element) => element.id == pid);
    prodcutList[singleProductIndex] = newProduct;

    notifyListeners();
  }
}
