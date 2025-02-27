import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/di/dependency_injection.dart';
import 'package:store_app/features/home/logic/cubit/home_cubit.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../widget/all_categories_list/all_categories_bloc_builder.dart';
import '../widget/category_grid_view/category_bloc_builder.dart';
import '../widget/home_to_bar.dart';

class HomeScreenDesign extends StatelessWidget {
  const HomeScreenDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(getIt()),
      child: Column(
        children: [
          const HomeToBar(),
          verticalSpace(30),
          const AllCategoriesBlocBuilder(),
          verticalSpace(30),
          _textProductsAndViewAll(),
          CategoryBlocBuilder(),
        ],
      ),
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
