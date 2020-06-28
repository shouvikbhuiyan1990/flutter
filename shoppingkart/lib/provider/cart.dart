import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  double price;
  int quantity;

  CartItem(
      {@required this.id,
      @required this.title,
      @required this.price,
      @required this.quantity});
}

class Cart extends ChangeNotifier {
  Map<String, CartItem> items = {};

  Map<String, CartItem> get getAllCartItems {
    return {...items};
  }

  int get getTotalCartLength {
    return items.length;
  }

  double get getTotalPrice {
    double price = 0;
    items.forEach((key, value) {
      double individualPrice = value.price * value.quantity;

      price = price + individualPrice;
    });

    return price;
  }

  int get getTotalCartLengthQuantity {
    int cartlength = 0;
    items.forEach((key, value) {

      cartlength = cartlength + value.quantity;
    });

    return cartlength;
  }

  void addNewCartItem(String productId, String title, double price) {
    if (items.containsKey(productId)) {
      items[productId].quantity = items[productId].quantity + 1;
    } else {
      items.putIfAbsent(productId, () {
        return CartItem(
          id: DateTime.now().toString(),
          title: title,
          quantity: 1,
          price: price,
        );
      });
    }

    notifyListeners();
  }
}
