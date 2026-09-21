import 'package:flutter/material.dart';
import 'package:flutter_mvvm/domain/models/cart_item.dart';
import 'package:flutter_mvvm/domain/models/product.dart';

class CartViewmodel extends ChangeNotifier {
  final List<CartItem> _items = [];
  List<CartItem> get items => _items;

  void addProductToCart(Product product) {
    for (int i = 0; i < _items.length; i++) {
      if (isProductInCart(product)) {
        _items[i].productCount++;
        notifyListeners();
        return;
      }
    }
    _items.add(CartItem(product: product, productCount: 1));
    notifyListeners();
  }

  bool isProductInCart(Product product) {
    for (int i = 0; i < _items.length; i++) {
      if (_items[i].product.id == product.id) {
        return true;
      }
    }
    return false;
  }
}
