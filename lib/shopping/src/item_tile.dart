import 'package:silicon/sorcery.dart';

import 'package:dart/shopping/cart_item.dart';

import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  ItemTile({this.item});
  final CartItem item;

  @override
  Widget build(BuildContext context) {
    final productColor = Color(item.product.color.hashCode | 0xFF000000);
    final textStyle = TextStyle(
        color: isDark(productColor) ? Colors.white : Colors.black);

    return Container(
      color: productColor,
      child: ListTile(
        title: Text(
          item.product.name,
          style: textStyle,
        ),
        trailing: CircleAvatar(
            backgroundColor: const Color(0x33FFFFFF),
            child: Text(item.count.toString(), style: textStyle)),
      ),
    );
  }
}
