import 'package:dio/dio.dart';
import 'package:flutter_mvvm/data/services/api/models/login_request.dart';
import 'package:flutter_mvvm/data/services/api/models/login_response.dart';
import 'package:flutter_mvvm/domain/models/product.dart';
import 'package:flutter_mvvm/utils/result.dart';

class ApiClient {
  final String _apiURL;
  final Dio _dio;

  const ApiClient({required this._apiURL, required this._dio});

  Future<Result<LoginResponse>> login(LoginRequest loginRequest) async {
    try {
      final endpoint = '$_apiURL/auth/login';
      final response = await _dio.post(endpoint, data: loginRequest.toJson());

      if (response.statusCode == 200) {
        final result = LoginResponse.fromJson(response.data);
        return Result.ok(result);
      }
      return Result.error(Exception('Ocorreu um erro ao realizar o login'));
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<List<Product>>> getProducts() async {
    try {
      final endpoint = '$_apiURL/products';
      final response = await _dio.get(endpoint);

      if (response.statusCode == 200) {
        final productsJson = (response.data["products"] as List);
        final products = productsJson
            .map((product) => Product.fromJson(product))
            .toList();
        return Result.ok(products);
      }
      return Result.error(Exception('Ocorreu um erro ao buscar os produtos'));
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
