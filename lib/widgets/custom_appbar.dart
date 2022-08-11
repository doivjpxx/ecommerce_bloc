import 'package:ecommerce_bloc/screens/wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_bloc/configs/theme.dart';

@immutable
class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  String title;

  CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(title,
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: Colors.white)),
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, WishlistScreen.routeName);
          },
          icon: const Icon(Icons.favorite),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
