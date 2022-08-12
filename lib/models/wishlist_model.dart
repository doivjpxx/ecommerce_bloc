import 'package:ecommerce_bloc/blocs/wishlist/bloc/wishlist_bloc.dart';
import 'package:ecommerce_bloc/models/product_model.dart';
import 'package:equatable/equatable.dart';

class Wishlist extends Equatable {
  final List<Product> products;

  const Wishlist({this.products = const <Product>[]});

  @override
  List<Object?> get props => [products];
}

class StartWishlist extends WishlistEvent {}

class AddWishlistProduct extends WishlistEvent {
  final Product product;

  const AddWishlistProduct(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveWishlistProduct extends WishlistEvent {
  final Product product;

  const RemoveWishlistProduct(this.product);

  @override
  List<Object> get props => [product];
}
