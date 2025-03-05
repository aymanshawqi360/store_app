import 'package:flutter/material.dart';

class Carts extends StatelessWidget {
  const Carts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      bottom: 16.0,
      child: Container(
        height: 50,
        width: 45,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: GestureDetector(
          onTap: () {},
          child: Image.asset(
            "assets/images/ordering_app_cart.png",
            scale: 19,
          ),
        ),
      ),
    );
  }
}
