import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/di/dependency_injection.dart';
import 'package:store_app/core/helpers/spacing.dart';
import 'package:store_app/core/theming/styles.dart';
import 'package:store_app/features/cart/cubit/cart_cubit.dart';
import 'package:store_app/features/home/logic/cubit/home_cubit.dart';
import 'package:store_app/features/home/ui/widget/all_categories_list/all_categories_bloc_builder.dart';
import 'package:store_app/features/home/ui/widget/category_grid_view/category_bloc_builder.dart';
import 'package:store_app/features/home/ui/widget/home_to_bar.dart';

class HomeScreenDesign extends StatefulWidget {
  const HomeScreenDesign({super.key});

  @override
  State<HomeScreenDesign> createState() => _HomeScreenDesignState();
}

class _HomeScreenDesignState extends State<HomeScreenDesign> {
  @override
  Widget build(BuildContext context) {
    //backgroundColor: const Color(0xffF2F3F7),
    return BlocProvider(
      create: (context) => getIt<HomeCubit>(),
      //  HomeCubit(getIt()),
      // ..getALLCategories()
      // ..getCategory("electronics"),
      child: Column(
        children: [
          const HomeToBar(),
          verticalSpace(40),
          const AllCategoriesBlocBuilder(),
          verticalSpace(40),
          _textProductsAndViewAll(),
          const CategoryBlocBuilder(),
        ],
      ),
    );
  }

  // @override
  Widget _textProductsAndViewAll() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Products",
            style: TextStyles.font22BlackSemiBold,
          ),
          Text(
            "View all",
            style: TextStyles.font13BlackSemiBold,
          )
        ],
      ),
    );
  }
}
