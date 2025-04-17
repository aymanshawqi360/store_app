import 'package:flutter/material.dart';
import 'package:store_app/features/home/data/models/products_response_model.dart';

class Carts extends StatelessWidget {
  final ProductsData productsData;
  const Carts({
    super.key,
    required this.productsData,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      bottom: 0.0,
      child: Container(
        height: 50,
        width: 45,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: GestureDetector(
          onTap: () {
            // getIt<CartCubit>().addToCart(productsData);
            //   GetItCubit.getItAddCart.addToCart(productsData);
          },
          child: Image.asset(
            "assets/images/ordering_app_cart.png",
            scale: 19,
          ),
        ),
      ),
    );
  }
}
