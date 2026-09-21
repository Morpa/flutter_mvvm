import 'package:flutter/material.dart';
import 'package:flutter_mvvm/ui/cart/view_models/cart_viewmodel.dart';
import 'package:flutter_mvvm/ui/product/view_models/product_viewmodel.dart';
import 'package:flutter_mvvm/ui/product/widgets/product_card.dart';

class ProductsListWidget extends StatelessWidget {
  final ProductViewmodel productViewmodel;
  final CartViewmodel cartViewmodel;

  const ProductsListWidget({
    super.key,
    required this.productViewmodel,
    required this.cartViewmodel,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: productViewmodel,
      builder: (context, child) {
        if (productViewmodel.products.isEmpty) {
          return Center(child: Text('Nenhum produto encontrado!'));
        }
        return ListView.builder(
          itemCount: productViewmodel.products.length,
          itemBuilder: (context, index) => ProductCard(
            cartViewmodel: cartViewmodel,
            product: productViewmodel.products[index],
          ),
        );
      },
    );
  }
}
