import 'package:flutter/material.dart';

class Favorited extends StatelessWidget {
  const Favorited({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          "assets/images/favorite(1).png",
          height: 24,
        )
      ],
    );

    //  const Positioned(
    //   top: 5,
    //   right: 5,
    //   child: Icon(
    //     Icons.favorite_rounded,
    //   ),
    // );
  }
}
