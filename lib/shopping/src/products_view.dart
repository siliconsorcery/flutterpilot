import 'package:flutter/material.dart';

import 'products_grid.dart';
import 'cart_view.dart';
import 'cart_button.dart';
import 'cart_provider.dart';

class ProductsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartBloc = CartProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        actions: <Widget>[
          StreamBuilder<int>(
            stream: cartBloc.itemCount,
            initialData: 0,
            builder: (context, snapshot) => CartButton(
                  itemCount: snapshot.data,
                  onPressed: () {
                    // Navigator.of(context).pushNamed(CartView.routeName);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CartView(),
                      ),
                    );
                  },
                ),
          )
        ],
      ),
      body: ProductGrid(),
    );
  }
}
