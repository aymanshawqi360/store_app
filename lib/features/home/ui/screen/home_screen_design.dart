import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/helpers/spacing.dart';
import 'package:store_app/features/home/ui/widget/all_categories_list/all_categories_bloc_builder.dart';
import '../../../../core/theming/styles.dart';
import '../widget/category_grid_view/category_bloc_builder.dart';
import '../widget/home_to_bar.dart';
import '../widget/image_carouselslider.dart';

class HomeScreenDesign extends StatelessWidget {
  const HomeScreenDesign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              const HomeToBar(),
              verticalSpace(110),
              const AllCategoriesBlocBuilder(),
              verticalSpace(30),
              _textProductsAndViewAll(),
              const CategoryBlocBuilder()
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 100.h),
            child: const ImageCarouselSlider(),
          ),
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
