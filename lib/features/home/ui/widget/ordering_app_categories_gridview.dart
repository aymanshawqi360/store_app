import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/widget/stars_lis.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class OrderingAppCategoriesGridView extends StatelessWidget {
  const OrderingAppCategoriesGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 15.h),
        child: GridView.builder(
            itemCount: 6,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisExtent: 190,
                mainAxisSpacing: 25.0),
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
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
                                color: Colors.grey.shade200,
                                image: const DecorationImage(
                                  scale: 9,
                                  image: AssetImage(
                                    "assets/images/Mask group.png",
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: EdgeInsets.only(right: 7.w, top: 5.h),
                              child: const Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.favorite_rounded,
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                        verticalSpace(1),
                        Text("Mens T-Shirt",
                            overflow: TextOverflow.ellipsis,
                            strutStyle: const StrutStyle(leading: 0.5),
                            style: TextStyles.font14DarkGraySemiBold),
                        Row(children: StarsLis.start),
                        Text(
                          "\$${118}",
                          strutStyle: const StrutStyle(leading: 1.2),
                          style: TextStyles.font12DarkGraySemiBold,
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
