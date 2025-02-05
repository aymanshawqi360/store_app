import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/helpers/images_list.dart';
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
            image: AssetImage("${ImagesList.productsOfferList[index]}"),
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
            padding: EdgeInsets.only(
              left: 60.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Majority's best\nchoice",
                    style: TextStyles.font13BlackSemiBold
                        .copyWith(fontSize: 19.sp)),
                Padding(
                  padding: EdgeInsets.only(right: 18.w),
                  child: Text("Look attractive",
                      style: TextStyles.font14SlateGrayLight),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  height: 27.h,
                  width: 80.w,
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
          ),
        ],
      ),
    );
  }
}
