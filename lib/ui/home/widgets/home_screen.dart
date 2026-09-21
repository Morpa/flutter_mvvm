import 'package:flutter/material.dart';
import 'package:flutter_mvvm/config/dependecies.dart';
import 'package:flutter_mvvm/ui/cart/view_models/cart_viewmodel.dart';
import 'package:flutter_mvvm/ui/product/view_models/product_viewmodel.dart';
import 'package:flutter_mvvm/ui/product/widgets/products_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: ProductsWidget(
        productViewmodel: ProductViewmodel(productRepository: getIt()),
        cartViewmodel: CartViewmodel(),
      ),
    );
  }
}
