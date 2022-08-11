import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({
    required this.product,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 150,
          width: MediaQuery.of(context).size.width / 2.5,
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 60,
          left: 5,
          child: Container(
            width: MediaQuery.of(context).size.width / 2.5 - 10,
            height: 80,
            decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
          ),
        ),
        Positioned(
          top: 65,
          left: 5,
          child: Container(
            width: MediaQuery.of(context).size.width / 2.5 - 10,
            height: 70,
            decoration: BoxDecoration(color: Colors.black),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.white),
                      ),
                      Text(
                        '\$${product.price}',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_circle,
                        color: Colors.white,
                      )),
                ),
              ]),
            ),
          ),
        ),
      ],
    );
  }
}