import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => CatalogScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  const CatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Catalog'),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
