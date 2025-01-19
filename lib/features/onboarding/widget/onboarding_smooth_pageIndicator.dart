import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingSmoothPageindicator extends StatelessWidget {
  final PageController controller;
  final int count;
  const OnboardingSmoothPageindicator({
    Key? key,
    required this.controller,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SmoothPageIndicator(
            controller: controller,
            count: count,
            axisDirection: Axis.horizontal,
            effect: const SlideEffect(
                spacing: 8.0,
                radius: 14.0,
                dotWidth: 17.0,
                dotHeight: 17.0,
                paintStyle: PaintingStyle.stroke,
                strokeWidth: 1.5,
                dotColor: Colors.grey,
                activeDotColor: Colors.black),
          ),
          GestureDetector(
              onTap: () {
                controller.animateToPage(count - 1,
                    duration: const Duration(seconds: 1),
                    curve: Curves.slowMiddle);
              },
              child: const Text("Skip"))
        ],
      ),
    );
  }
}
