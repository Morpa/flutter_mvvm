import 'package:flutter_mvvm/domain/models/product.dart';
import 'package:flutter_mvvm/utils/result.dart';

abstract class ProductRepository {
  Future<Result<List<Product>>> getProducts();
}
