import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../widget/home_to_bar.dart';
import '../widget/image_carouselslider.dart';
import '../widget/ordering_app_categories_gridview.dart';
import '../widget/ordering_app_categories_list.dart';

class HomeScreenDesign extends StatelessWidget {
  const HomeScreenDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              const HomeToBar(),
              verticalSpace(110),
              const OrderingAppCategoriesList(),
              verticalSpace(30),
              _textProductsAndViewAll(),
              const OrderingAppCategoriesGridView()
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
            style: TextStyles.font20BlackSemiBold,
          ),
          Text(
            "View all",
            style: TextStyles.font10BlackSemiBold,
          )
        ],
      ),
    );
  }
}
