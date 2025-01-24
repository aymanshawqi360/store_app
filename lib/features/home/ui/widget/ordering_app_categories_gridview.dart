import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class OrderingAppCategoriesGridView extends StatelessWidget {
  final List<Widget> start;
  const OrderingAppCategoriesGridView({
    super.key,
    required this.start,
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
                crossAxisSpacing: 30.0,
                // childAspectRatio: 2 / 2.5,
                mainAxisExtent: 220,
                mainAxisSpacing: 25.0),
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    // width: 50,
                    // height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: ColorManager.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            // width: double.infinity,
                            // height: 70.h,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                image: const DecorationImage(
                                    scale: 7,
                                    image: AssetImage(
                                      "assets/images/Mask group.png",
                                    )),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                        verticalSpace(height: 1),
                        Text("Mens T-Shirt",
                            overflow: TextOverflow.ellipsis,
                            strutStyle: const StrutStyle(leading: 0.5),
                            style: TextStyles.font14DarkGraySemiBold),
                        Row(
                          children: start,
                        ),
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
                      //margin: EdgeInsets.symmetric(),
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
                  )
                ],
              );
            }),
      ),
    );
  }
}
