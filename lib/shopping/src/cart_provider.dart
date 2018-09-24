import 'package:flutter/widgets.dart';
import 'package:dart/shopping/cart_bloc.dart';

/// This is an InheritedWidget that wraps around [CartBloc]. Think about this
/// as Scoped Model for that specific class.
///
/// This merely solves the "passing reference down the tree" problem for us.
/// You can solve this in other ways, like through dependency injection.
///
/// Also note that this does not call [CartBloc.dispose]. If your app
/// ever doesn't need to access the cart, you should make sure it's
/// disposed of properly.
class CartProvider extends InheritedWidget {
  
  CartProvider({
    Key key,
    CartBloc cartBloc,
    Widget child,
  }) : 
    this.cartBloc = cartBloc ?? CartBloc(),
    super(key: key, child: child);

  final CartBloc cartBloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static CartBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(CartProvider) as CartProvider)
          .cartBloc;
}
