import 'package:ecommerce_bloc/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/cart_model.dart';
import '../../widgets/cart_product_card.dart';
import '../../widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => CartScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Cart'),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {},
                child: Text('go to checkout'.toUpperCase(),
                    style: Theme.of(context).textTheme.headline3),
              ),
            ],
          ),
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is CartLoaded) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              state.cart.freeDeliveryString,
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/');
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.black,
                                  shape: RoundedRectangleBorder(),
                                  elevation: 0),
                              child: Text(
                                'Add more item',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          height: 400,
                          child: ListView.builder(
                              itemCount: state.cart.products.length,
                              itemBuilder: (context, index) => CartProductCard(
                                  product: state.cart.products[index])),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Divider(
                          thickness: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'subtotal'.toUpperCase(),
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                  Text(
                                    '\$${state.cart.subtotalString}',
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'delivery fee'.toUpperCase(),
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                  Text(
                                    '\$${state.cart.deliveryFeeString}',
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.black.withAlpha(50),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              margin: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                color: Colors.black,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'total'.toUpperCase(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(color: Colors.white),
                                    ),
                                    Text(
                                      '\$${state.cart.totalString}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ]),
            );
          }
          return Text('Something went wrong');
        },
      ),
    );
  }
}
