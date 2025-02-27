import 'package:flutter/material.dart';

class Favorited extends StatelessWidget {
  const Favorited({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: 5,
      right: 5,
      child: Icon(
        Icons.favorite_rounded,
      ),
    );
  }
}
