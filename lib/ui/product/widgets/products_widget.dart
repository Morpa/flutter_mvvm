import 'package:flutter/material.dart';
import 'package:flutter_mvvm/ui/cart/view_models/cart_viewmodel.dart';
import 'package:flutter_mvvm/ui/product/view_models/product_viewmodel.dart';
import 'package:flutter_mvvm/ui/product/widgets/products_list_widget.dart';

class ProductsWidget extends StatefulWidget {
  final ProductViewmodel productViewmodel;
  final CartViewmodel cartViewmodel;

  const ProductsWidget({
    super.key,
    required this.productViewmodel,
    required this.cartViewmodel,
  });

  @override
  State<ProductsWidget> createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  @override
  void initState() {
    super.initState();
    widget.productViewmodel.load.execute();
  }

  @override
  Widget build(BuildContext context) {
    final command = widget.productViewmodel.load;
    return ListenableBuilder(
      listenable: command,
      builder: (context, child) {
        if (command.running) {
          return Center(child: CircularProgressIndicator());
        }
        if (command.error) {
          return Center(child: Text('Ocorreu um erro ao carregar os produtos'));
        }
        return child!;
      },
      child: ProductsListWidget(
        productViewmodel: widget.productViewmodel,
        cartViewmodel: widget.cartViewmodel,
      ),
    );
  }
}
