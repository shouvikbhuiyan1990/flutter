import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductItem extends ChangeNotifier {
  @required
  final String id;
  @required
  final String title;
  @required
  final String description;
  @required
  final String imageUrl;
  @required
  final double price;
  bool isFavourite;

  ProductItem({
    this.id,
    this.title,
    this.description,
    this.imageUrl,
    this.price,
    this.isFavourite = false,
  });

  Future<void> togglePreference() async {
    bool oldPreference = isFavourite;
    isFavourite = !isFavourite;
    notifyListeners();
    final url =
        'https://flutter-firebase-4e47a.firebaseio.com/products/$id.json';
    try {
      final response = await http.patch(
        url,
        body: json.encode({
          'isFavourite': !oldPreference,
        }),
      );
      if (response.statusCode >= 400) {
        isFavourite = oldPreference;
        notifyListeners();
      }
    } catch (e) {
      isFavourite = oldPreference;
      notifyListeners();
      throw e;
    }
  }
}
