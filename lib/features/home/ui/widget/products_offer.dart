import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/core/helpers/spacing.dart';
import '../../../../core/helpers/images_list.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class ProductsOffer extends StatelessWidget {
  final int index;
  const ProductsOffer({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        margin: EdgeInsets.symmetric(
          horizontal: 10.w,
        ),
        decoration: BoxDecoration(
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
          children: [
            Image.asset(
              "${ImagesList.productsOfferList[index].toString()}",
              scale: 0.1,
            ),
            horizontalSpace(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Majority's best\nchoice",
                    style:
                        TextStyles.font13BlackSemiBold.copyWith(fontSize: 17)),
                Text("Look attractive", style: TextStyles.font14SlateGrayLight),
                Container(
                  height: 19,
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
                        "assets/svgs/chm.svg", height: 13,
                      )
                    ],
                  )),
                ),
              ],
            ),
          ],
        ));
  }
}
