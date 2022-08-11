import 'package:ecommerce_bloc/screens/cart/cart_screen.dart';
import 'package:ecommerce_bloc/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, CartScreen.routeName);
                },
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}
