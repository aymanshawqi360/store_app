import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/helpers/spacing.dart';
import 'package:store_app/core/theming/styles.dart';
import 'package:store_app/features/home/logic/cubit/categories_cubit.dart';
import 'package:store_app/features/home/logic/cubit_categories/cubit/products_cubit.dart';
import 'package:store_app/features/home/ui/screen/categories/categories_bloc.dart';
import 'package:store_app/features/home/ui/screen/products/products_bloc.dart';
import 'package:store_app/features/home/ui/widget/home_to_bar.dart';

class HomeScreenDesign extends StatefulWidget {
  const HomeScreenDesign({super.key});

  @override
  State<HomeScreenDesign> createState() => _HomeScreenDesignState();
}

class _HomeScreenDesignState extends State<HomeScreenDesign> {
  @override
  void initState() {
    context.read<CategoriesCubit>().getALLCategories();
    context.read<ProductsCubit>().getProducts();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomeToBar(),
        verticalSpace(40),
        const CategoriesBloc(),
        verticalSpace(40),
        _textProductsAndViewAll(),
        verticalSpace(20),
        const ProductsBloc(),
      ],
    );
  }

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
