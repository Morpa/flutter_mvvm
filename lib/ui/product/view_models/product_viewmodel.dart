import 'package:flutter/material.dart';
import 'package:flutter_mvvm/data/repositories/product/product_repository.dart';
import 'package:flutter_mvvm/domain/models/product.dart';
import 'package:flutter_mvvm/utils/command.dart';
import 'package:flutter_mvvm/utils/result.dart';

class ProductViewmodel extends ChangeNotifier {
  final ProductRepository _productRepository;

  ProductViewmodel({required this._productRepository});

  List<Product> _products = [];
  List<Product> get products => _products;

  late final load = Command0(_load);

  Future<Result<List<Product>>> _load() async {
    try {
      final result = await _productRepository.getProducts();
      switch (result) {
        case Ok<List<Product>>():
          _products = result.value;
          return result;
        default:
          return result;
      }
    } finally {
      notifyListeners();
    }
  }
}
