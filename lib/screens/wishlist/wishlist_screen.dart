import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wishlist';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => WishlistScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Wishlist'),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
