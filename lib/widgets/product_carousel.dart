import 'package:ecommerce_bloc/widgets/product_card.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;
  const ProductCarousel({
    required this.products,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
        itemCount: products.length,
        itemBuilder: ((context, index) => Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: ProductCard(product: products[index]),
            )),
      ),
    );
  }
}
