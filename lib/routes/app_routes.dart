import 'package:ecommerce_bloc/models/category_model.dart';
import 'package:ecommerce_bloc/screens/cart/cart_screen.dart';
import 'package:ecommerce_bloc/screens/catalog/catalog_screen.dart';
import 'package:ecommerce_bloc/screens/home/home_screen.dart';
import 'package:ecommerce_bloc/screens/product/product_screen.dart';
import 'package:ecommerce_bloc/screens/wishlist/wishlist_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    print('This is route: ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case ProductScreen.routeName:
        return ProductScreen.route();
      case WishlistScreen.routeName:
        return WishlistScreen.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(title: Text('Error page')),
            ));
  }
}
