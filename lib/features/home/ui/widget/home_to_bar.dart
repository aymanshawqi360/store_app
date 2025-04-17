import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/helpers/app_assets.dart';
import 'package:store_app/core/theming/colors.dart';
import 'package:store_app/core/theming/styles.dart';
import 'package:store_app/features/home/ui/widget/image_carouselslider.dart';

class HomeToBar extends StatelessWidget {
  const HomeToBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 170.h,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
              gradient: LinearGradient(
                colors: [ColorManager.royalBlue, ColorManager.darkPurple],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                AppAssets.search,
                color: ColorManager.white,
                width: 22,
              ),
              Row(
                children: [
                  Image.asset(
                    AppAssets.appLogo,
                    color: ColorManager.white,
                    width: 49,
                  ),
                  Text(
                    "Ordering App",
                    style: TextStyles.font22BlackSemiBold.copyWith(
                      color: ColorManager.white,
                      fontSize: 19.sp,
                    ),
                  ),
                ],
              ),
              Image.asset(
                AppAssets.notification,
                color: ColorManager.white,
                width: 23,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 90.h),
          child: const ImageCarouselSlider(),
        ),
      ],
    );
  }
}
