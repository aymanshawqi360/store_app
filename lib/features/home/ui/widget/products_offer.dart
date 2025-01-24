import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/core/widget/images_list.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class ProductsOffer extends StatelessWidget {
  final int index;
  const ProductsOffer({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10.w,
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage("${ImagesList.productsOfferList[index].toString()}"),
            alignment: Alignment.centerLeft,
          ),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ColorManager.lightBlue,
              ColorManager.softPurple,
            ],
          ),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 65.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Majority's best\nchoice",
                    style: TextStyles.font10BlackSemiBold
                        .copyWith(fontSize: 16.sp)),
                Padding(
                  padding: EdgeInsets.only(right: 11.w),
                  child: Text("Look attractive",
                      style: TextStyles.font14SlateGrayLight),
                ),
                verticalSpace(height: 5),
                Container(
                  height: 23.h,
                  width: 85.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "See more ",
                        style: TextStyles.font13DarkPurpleMedium,
                      ),
                      SvgPicture.asset(
                        // width: 100,
                        "assets/svg/chm.svg", height: 13,
                      )
                    ],
                  )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
