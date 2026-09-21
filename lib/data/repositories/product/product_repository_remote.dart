import 'package:flutter_mvvm/data/repositories/product/product_repository.dart';
import 'package:flutter_mvvm/data/services/api/api_client.dart';
import 'package:flutter_mvvm/domain/models/product.dart';
import 'package:flutter_mvvm/utils/result.dart';

class ProductRepositoryRemote implements ProductRepository {
  final ApiClient _apiClient;

  const ProductRepositoryRemote({required this._apiClient});

  @override
  Future<Result<List<Product>>> getProducts() async {
    return await _apiClient.getProducts();
  }
}
