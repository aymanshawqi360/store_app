import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/helpers/spacing.dart';

import '../../../../../core/theming/colors.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [ColorManager.darkPurple, ColorManager.royalBlue]),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/cart(2).png",
            color: ColorManager.ghostWhite,
            height: 25,
          ),
          horizontalSpace(10),
          Text(
            "Add to cart",
            style: TextStyle(
                color: Colors.white.withOpacity(1),
                fontSize: 15.sp,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
