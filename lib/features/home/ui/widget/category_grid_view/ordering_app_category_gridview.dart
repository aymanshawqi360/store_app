import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/features/home/ui/widget/category_grid_view/carts.dart';
import 'package:store_app/features/home/ui/widget/category_grid_view/favorited.dart';
import '../../../../../core/helpers/spacing.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../data/models/products_response_model.dart';

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
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: ColorManager.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        imagesAndFavorited(cubitList),
                        verticalSpace(5),
                        title(cubitList),
                        Row(children: [
                          SvgPicture.asset(
                            "assets/svgs/star.svg",
                            width: 15,
                          ),
                          horizontalSpace(2),
                          rate(cubitList)
                        ]),
                        price(cubitList),
                      ],
                    ),
                  ),
                  const Carts()
                ],
              );
            }),
      ),
    );
  }

  Padding imagesAndFavorited(ProductsData cubitList) {
    return Padding(
      padding: EdgeInsets.only(right: 5.w, top: 5.h),
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 5.h),
          height: 70.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                cubitList.image.toString(),
              ),
            ),
          ),
          child: const Favorited()),
    );
  }

  Text title(ProductsData cubitList) {
    return Text("${cubitList.title}",
        overflow: TextOverflow.ellipsis,
        strutStyle: const StrutStyle(leading: 0.4),
        style: TextStyles.font14BlackSemiBold);
  }

  Text price(ProductsData cubitList) {
    return Text(
      "\$${cubitList.price}",
      strutStyle: const StrutStyle(leading: 0.5),
      style: TextStyles.font13DarkGrayRegular,
    );
  }

  Widget rate(ProductsData cubitList) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h),
      child: Text(
        cubitList.rating!.rate.toString(),
      ),
    );
  }
}
