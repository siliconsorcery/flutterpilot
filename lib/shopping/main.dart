import 'package:flutter/material.dart';

import 'src/catalog_provider.dart';
import 'src/cart_provider.dart';
import 'src/products_view.dart';

void main() => runApp(ShoppingPage());

class ShoppingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CatalogProvider(
      child: CartProvider(     
        child: MaterialApp(home: ProductsView()),
      ),
    );
  }
}
