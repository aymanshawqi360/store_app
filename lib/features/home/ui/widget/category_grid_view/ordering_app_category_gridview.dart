import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:store_app/core/helpers/spacing.dart';
import 'package:store_app/features/home/ui/widget/category_grid_view/carts.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../data/models/products_response_model.dart';
import 'favorited.dart';

class OrderingAppCategoriesGridView extends StatelessWidget {
  final List<ProductsData> categoryList;
  const OrderingAppCategoriesGridView({
    super.key,
    required this.categoryList,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 0.h),
      child: GridView.builder(
          itemCount: categoryList.length,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15.0,
              mainAxisExtent: 160,
              mainAxisSpacing: 18.0),
          itemBuilder: (context, index) {
            final cubitList = categoryList[index];
            return Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: ColorManager.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: EdgeInsets.only(right: 5.w, top: 5.h),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(top: 5.h),
                                      child: Image.network(
                                          height: 70, "${cubitList.image}")),
                                ]),
                          ),
                        ),
                      ),
                      Text("${cubitList.title}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          strutStyle: const StrutStyle(leading: 0.7),
                          style: TextStyles.font14DarkGraySemiBold),
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/svgs/star.svg",
                            width: 16,
                          ),
                          horizontalSpace(2),
                          Text(cubitList.rating!.rate.toString())
                        ],
                      ),
                      Text(
                        "\$${cubitList.price}",
                        strutStyle: const StrutStyle(leading: 1.2),
                        style: TextStyles.font16DarkGraySemiBold
                            .copyWith(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                const Carts(),
                const Favorited(),
              ],
            );
          }),
    ));
  }
}
