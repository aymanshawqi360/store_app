import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                        //  verticalSpace(1),
                          Text("Mens T-Shirt",
                              overflow: TextOverflow.ellipsis,
                              strutStyle: const StrutStyle(leading: 0.5),
                              style: TextStyles.font14DarkGraySemiBold),
                          Row(children: [
                              SvgPicture.asset(
                            "assets/svgs/star.svg",
                            width: 16,
                          ),
                          horizontalSpace(2),
                          Text(cubitList.rating!.rate.toString())
                          ]),
                          Text(
                            "\$${118}",
                            strutStyle: const StrutStyle(leading: 1.2),
                            style: TextStyles.font13DarkGrayLight,
                          ),
                        
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 50,
                      width: 45,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          "assets/images/ordering_app_cart.png",
                          scale: 19,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
