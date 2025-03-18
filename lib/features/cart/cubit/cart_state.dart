part of 'cart_cubit.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class ProductsCart extends CartState {
  final Map<ProductsData, int> cart;

  ProductsCart({required this.cart});
}

class Increment extends CartState {}

class Decrement extends CartState {}
