import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:store_app/core/helpers/extensions.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/theming/colors.dart';
import '../../../core/theming/styles.dart';

class OrderingAppImageAndTextBestOfThisMonths extends StatelessWidget {
  final String image;
  OrderingAppImageAndTextBestOfThisMonths({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "${image}",
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 54.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "Best of this months\nCollection",
                  style: TextStyles.font30WhiteSemiBold.copyWith(
                    height: 1.1,
                  ),
                ),
              ],
            ),
          ),
          // Positioned(
          //     // bottom: 0,
          //     child: ),
          Padding(
            padding: EdgeInsets.only(bottom: 15.h, right: 10.w, left: 10.w),
            child: SlideAction(
              height: 50.h,
              sliderButtonIconSize: 18,
              outerColor: ColorManager.royalBlue,
              alignment: Alignment.bottomCenter,
              borderRadius: 9,
              elevation: 5,
              onSubmit: () => context.pushNamed(Routes.homeScreen),
              text: "Go to Home",
            ),
          ),
        ],
      ),
    );
  }
}
