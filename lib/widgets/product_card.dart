import 'package:ecommerce_bloc/models/wishlist_model.dart';
import 'package:ecommerce_bloc/screens/product/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart/cart_bloc.dart';
import '../blocs/wishlist/wishlist_bloc.dart';
import '../models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool isWishlist;

  const ProductCard({
    required this.product,
    this.widthFactor = 2.5,
    this.leftPosition = 5,
    this.isWishlist = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductScreen.routeName,
            arguments: product);
      },
      child: Stack(
        children: [
          SizedBox(
            height: 150,
            width: widthValue,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 60,
            left: leftPosition,
            child: Container(
              width: widthValue - 5 - leftPosition,
              height: 80,
              decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
            ),
          ),
          Positioned(
            top: 65,
            left: leftPosition + 5,
            child: Container(
              width: widthValue - 15 - leftPosition,
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
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      return Expanded(
                        child: IconButton(
                            onPressed: () {
                              context
                                  .read<CartBloc>()
                                  .add(CartProductAdded(product));
                            },
                            icon: Icon(
                              Icons.add_circle,
                              color: Colors.white,
                            )),
                      );
                    },
                  ),
                  isWishlist
                      ? BlocBuilder<WishlistBloc, WishlistState>(
                          builder: (context, state) {
                            return Expanded(
                                child: IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                context
                                    .read<WishlistBloc>()
                                    .add(RemoveWishlistProduct(product));
                              },
                            ));
                          },
                        )
                      : SizedBox()
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
