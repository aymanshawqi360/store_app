import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/di/dependency_injection.dart';
import 'package:store_app/core/theming/colors.dart';
import 'package:store_app/core/theming/styles.dart';
import 'package:store_app/features/home/logic/cubit_layout_navigation/cubit/layout_screen_cubit.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({
    super.key,
  });

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LayoutScreenCubit>(),
      child: BlocBuilder<LayoutScreenCubit, LayoutScreenState>(
        builder: (context, state) {
          final cubit = context.read<LayoutScreenCubit>();
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
                                iconOne: "assets/images/home (1).png",
                                iconTwo: "assets/images/home (2).png",
                                index: 0,
                                label: "Home",
                                height: 24.0,
                                context),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 1.h),
                            child: _buildNavItem(
                                iconOne: "assets/images/category(1).png",
                                iconTwo: "assets/images/category(2).png",
                                index: 1,
                                label: "Caregories",
                                height: 24.0,
                                context),
                          ),
                          _buildNavItem(
                              iconOne: "assets/images/favorite(1).png",
                              iconTwo: "assets/images/favorite(2).png",
                              index: 2,
                              label: "Favorite",
                              height: 25.8,
                              context),
                          _buildNavItem(
                              iconOne: "assets/images/cart(1).png",
                              iconTwo: "assets/images/cart(2).png",
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
              body: cubit.layoutScreen[cubit.bottomNavigationBarCurrentIndex]);
        },
      ),
    );
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
        context.read<LayoutScreenCubit>().getCurrentIndex(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          index ==
                  context
                      .read<LayoutScreenCubit>()
                      .bottomNavigationBarCurrentIndex
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
                    style: index ==
                            context
                                .read<LayoutScreenCubit>()
                                .bottomNavigationBarCurrentIndex
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
