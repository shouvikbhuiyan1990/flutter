import 'package:flutter/material.dart';

class Product extends ChangeNotifier {
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

  Product({
    this.id,
    this.title,
    this.description,
    this.imageUrl,
    this.price,
    this.isFavourite = false,
  });

  void togglePreference() {
    isFavourite = !isFavourite;
    notifyListeners();
  }
}
