import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/home/ui/widget/image_carouselslider.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

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
                "assets/images/search.png",
                color: ColorManager.white,
                width: 22,
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/images/app_logo.png",
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
                "assets/images/Notification.png",
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
