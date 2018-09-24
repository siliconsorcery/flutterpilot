import 'package:flutter/widgets.dart';
import 'package:dart/shopping/catalog_bloc.dart';

/// The equivalent of [CartProvider], but for [CatalogBloc].
class CatalogProvider extends InheritedWidget {

  CatalogProvider({
    Key key,
    CatalogBloc catalogBloc,
    Widget child,
  }) : 
    this.catalogBloc = catalogBloc ?? CatalogBloc(),
    super(key: key, child: child);

  final CatalogBloc catalogBloc;
  
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static CatalogBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(CatalogProvider) as CatalogProvider)
          .catalogBloc;
}
