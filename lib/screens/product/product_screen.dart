import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => ProductScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Product'),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
