import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/helpers/spacing.dart';
import 'package:store_app/core/widget/stars_lis.dart';
import '../../../../core/theming/styles.dart';
import '../widget/home_to_bar.dart';
import '../widget/image_carouselslider.dart';
import '../widget/ordering_app_categories_gridview.dart';
import '../widget/ordering_app_categories_list.dart';

class HomeScreenDesign extends StatelessWidget {
  HomeScreenDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              const HomeToBar(),
              verticalSpace(height: 75),
              const OrderingAppCategoriesList(),
              _textProductsAndViewAll(),
              verticalSpace(height: 0),
              OrderingAppCategoriesGridView(start: StarsLis.start)
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 100.h),
            child: ImageCarouselSlider(),
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
