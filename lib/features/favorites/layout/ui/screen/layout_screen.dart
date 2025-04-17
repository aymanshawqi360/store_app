import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/di/dependency_injection.dart';
import 'package:store_app/core/helpers/app_assets.dart';
import 'package:store_app/core/theming/colors.dart';
import 'package:store_app/core/theming/styles.dart';
import 'package:store_app/features/cart/cart_screen.dart';
import 'package:store_app/features/categories/categories_screen.dart';
import 'package:store_app/features/favorites/ui/favorites_screen.dart';
import 'package:store_app/features/home/logic/cubit/categories_cubit.dart';
import 'package:store_app/features/home/logic/cubit_categories/cubit/products_cubit.dart';
import 'package:store_app/features/home/ui/home_screen_design.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({
    super.key,
  });

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int navigation = 0;
  List<Widget> layoutScreen = [
    MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => CategoriesCubit(getIt()),
      ),
      BlocProvider(
        create: (context) => ProductsCubit(getIt()),
      ),
    ], child: const HomeScreenDesign()),
    const CategoriesScreen(),
    const FavoritesScreen(),
    const CartScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Stack(
          children: [
            Container(
              width: double.infinity,
              color: ColorManager.white,
              height: 65.h,
              child: Padding(
                padding: EdgeInsets.only(top: 3.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 1.h),
                      child: _buildNavItem(
                          iconOne: "assets/images/home_one.png",
                          iconTwo: "assets/images/home_two.png",
                          index: 0,
                          label: "Home",
                          height: 24.0,
                          context),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 1.h),
                      child: _buildNavItem(
                          iconOne: AppAssets.categoryOne,
                          iconTwo: AppAssets.categoryTwo,
                          index: 1,
                          label: "Caregories",
                          height: 24.0,
                          context),
                    ),
                    _buildNavItem(
                        iconOne: AppAssets.favoriteOne,
                        iconTwo: AppAssets.favoriteOne,
                        index: 2,
                        label: "Favorite",
                        height: 25.8,
                        context),
                    _buildNavItem(
                        iconOne: AppAssets.cartOne,
                        iconTwo: AppAssets.cartTwo,
                        index: 3,
                        label: "Cart",
                        height: 25.8,
                        context),
                  ],
                ),
              ),
            )
          ],
        ),
        body: layoutScreen[navigation]);
  }

  Widget _buildNavItem(
    BuildContext context, {
    required String iconOne,
    required String iconTwo,
    required int index,
    required double height,
    required String label,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          navigation = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          index == navigation
              ? Image.asset(iconOne,
                  height: height, color: ColorManager.royalBlue)
              : Image.asset(
                  iconTwo,
                  height: height,
                  color: ColorManager.silverGray,
                ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 1.h,
              top: 1.h,
            ),
            child: Row(
              children: [
                Text(label,
                    style: index == navigation
                        // context
                        //     .read<LayoutScreenCubit>()
                        //     .bottomNavigationBarCurrentIndex
                        ? TextStyles.font13blackMedium
                        : TextStyles.font13DarkGrayLight),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
