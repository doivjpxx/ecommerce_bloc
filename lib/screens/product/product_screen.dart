import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_bloc/models/product_model.dart';
import 'package:ecommerce_bloc/models/wishlist_model.dart';
import 'package:ecommerce_bloc/widgets/hero_carousel_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/wishlist/bloc/wishlist_bloc.dart';
import '../../widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';

  static Route route({required Product product}) {
    return MaterialPageRoute(
      builder: (_) => ProductScreen(
        product: product,
      ),
      settings: RouteSettings(name: routeName),
    );
  }

  final Product product;

  const ProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: product.name),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: SizedBox(
          height: 70,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.share,
                  color: Colors.white,
                )),
            BlocBuilder<WishlistBloc, WishlistState>(
              builder: (context, state) {
                return IconButton(
                    onPressed: () {
                      context
                          .read<WishlistBloc>()
                          .add(AddWishlistProduct(product));
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ));
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.white),
              onPressed: () {},
              child: Text('add to cart'.toUpperCase(),
                  style: Theme.of(context).textTheme.headline3),
            )
          ]),
        ),
      ),
      body: ListView(
        children: [
          CarouselSlider(
              options: CarouselOptions(
                  aspectRatio: 1.5,
                  viewportFraction: 0.9,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  enlargeCenterPage: true),
              items: [
                HeroCarouselCard(
                  product: product,
                )
              ]),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                alignment: Alignment.bottomCenter,
                color: Colors.black.withAlpha(50),
              ),
              Container(
                margin: const EdgeInsets.all(5.0),
                width: MediaQuery.of(context).size.width - 10,
                height: 50,
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      ]),
                ),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                'Product Information',
                style: Theme.of(context).textTheme.headline3,
              ),
              children: [
                ListTile(
                  title: Text(
                    'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                'Delivery Information',
                style: Theme.of(context).textTheme.headline3,
              ),
              children: [
                ListTile(
                  title: Text(
                    'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
