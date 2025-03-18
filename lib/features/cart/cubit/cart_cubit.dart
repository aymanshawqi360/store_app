import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:store_app/features/home/data/models/products_response_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  late StreamSubscription cartSubscription;
  CartCubit() : super(CartInitial());

  Map<ProductsData, int> cart = {};
  List<ProductsData> cartProductes = [];
  List<int> producteCounter = [];
  // int counter = 1;
  void addToCart(ProductsData productsData) {
    if (!cart.containsKey(productsData)) {
      cart[productsData] = 1;
      // cartProductes = cart.keys.map((toElement) => toElement).toList();

      print("key ===${cart[productsData]} || value ===${cart.values} ");
      print(cart);
    }
    emit(ProductsCart(cart: cart));
  }

  // void increment(ProductsData productsData) {
  //   if (cart.containsKey(productsData)) {
  //     cart[productsData] = cart[productsData]! + 1;
  //     producteCounter = cart.values.map((to) => to).toList();
  //     print(producteCounter);
  //   }
  //   emit(ProductsCart());
  // }

  // void decrement(ProductsData productsData) {
  //   if (cart.containsKey(productsData) && cart[productsData]! > 0) {
  //     cart[productsData] = cart[productsData]! - 1;
  //     producteCounter = cart.values.map((to) => to).toList();
  //     print(producteCounter);
  //   }
  //   emit(ProductsCart());
  // }
}
