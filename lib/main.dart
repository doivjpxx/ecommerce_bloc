import 'package:ecommerce_bloc/blocs/wishlist/bloc/wishlist_bloc.dart';
import 'package:ecommerce_bloc/models/wishlist_model.dart';
import 'package:ecommerce_bloc/routes/app_routes.dart';
import 'package:ecommerce_bloc/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_bloc/configs/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => WishlistBloc()..add(StartWishlist()))
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: theme(),
          onGenerateRoute: AppRoutes.onGenerateRoute,
          initialRoute: HomeScreen.routeName,
        ));
  }
}
