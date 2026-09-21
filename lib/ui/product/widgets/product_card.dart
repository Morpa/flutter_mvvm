import 'package:flutter/material.dart';
import 'package:flutter_mvvm/domain/models/product.dart';
import 'package:flutter_mvvm/ui/cart/view_models/cart_viewmodel.dart';
import 'package:flutter_mvvm/ui/cart/widgets/add_product_button.dart';
import 'package:flutter_mvvm/ui/cart/widgets/add_product_cart_icon.dart';

class ProductCard extends StatelessWidget {
  final CartViewmodel cartViewmodel;
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
    required this.cartViewmodel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white70),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(16),
      child: Column(
        spacing: 8,
        children: [
          Stack(
            children: [
              Image.network(product.thumbnail!),
              Positioned(
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color.fromARGB(255, 236, 140, 172),
                  ),
                  child: Text('${product.discountPercentage}% OFF'),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: ShoppingCartIcon(
                  viewModel: cartViewmodel,
                  product: product,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(product.title!, style: TextStyle(fontSize: 24)),
              ),
              Row(
                spacing: 8,
                children: [
                  Icon(Icons.star_border),
                  Text(product.rating.toString()),
                ],
              ),
            ],
          ),
          Row(
            spacing: 8,
            children: [
              Text(
                '${product.price} €',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                '${product.discountPercentage} €',
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Row(
            spacing: 8,
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Text('EM ESTOQUE'),
            ],
          ),
          AddProductButton(cartViewmodel: cartViewmodel, product: product),
        ],
      ),
    );
  }
}
