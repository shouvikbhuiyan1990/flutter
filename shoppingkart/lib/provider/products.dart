import 'package:flutter/material.dart';

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

  void togglePreference() {
    isFavourite = !isFavourite;
    notifyListeners();
  }
}
