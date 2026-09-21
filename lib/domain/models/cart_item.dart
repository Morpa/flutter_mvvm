import 'package:flutter_mvvm/domain/models/product.dart';

class CartItem {
  Product product;
  int productCount;
  CartItem({required this.product, required this.productCount});
}
