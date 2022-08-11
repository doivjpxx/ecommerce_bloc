import 'package:ecommerce_bloc/routes/app_routes.dart';
import 'package:ecommerce_bloc/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_bloc/configs/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: HomeScreen.routeName,
    );
  }
}
