import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/di/dependency_injection.dart';
import 'package:store_app/core/helpers/app_assets.dart';
import 'package:store_app/core/helpers/spacing.dart';
import 'package:store_app/core/routing/app_route.dart';
import 'package:store_app/core/theming/colors.dart';
import 'package:store_app/features/cart/constants/constants.dart';
import 'package:store_app/features/cart/cubit/cart_cubit.dart';

import 'package:store_app/features/home/data/models/products_response_model.dart';

class BottomAddToCart extends StatelessWidget {
  final ProductsData productsData;
  const BottomAddToCart({super.key, required this.productsData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<CartCubit>().addToCart(productsData);
      },
      child: Container(
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
              AppAssets.cartTwo,
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
      ),
    );
  }
}
