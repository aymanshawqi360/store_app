import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          height: 155.h,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
              gradient: LinearGradient(
                colors: [ColorManager.royalBlue, ColorManager.darkPurple],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 50.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                "assets/images/search.png",
                color: ColorManager.white,
                width: 27,
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/images/app_logo.png",
                    color: ColorManager.white,
                    width: 48,
                  ),
                  Text(
                    "Ordering App",
                    style: TextStyles.font20BlackSemiBold
                        .copyWith(color: ColorManager.white, fontSize: 17.sp),
                  ),
                ],
              ),
              Image.asset(
                "assets/images/Notification.png",
                color: ColorManager.white,
                width: 27,
              )
            ],
          ),
        ),
      ],
    );
  }
}
