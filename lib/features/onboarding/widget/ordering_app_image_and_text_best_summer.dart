import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/theming/styles.dart';

class OrderingAppImageAndTextBestSummer extends StatelessWidget {
  final String image;
  OrderingAppImageAndTextBestSummer({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "${image}",
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Positioned(
          top: 80,
          left: 27,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.w),
                child: Text(
                  "2022",
                  style: TextStyles.font22BlackSemiBold,
                ),
              ),
              verticalSpace(8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Text(
                  "Best Summer\nCollection",
                  style: TextStyles.font35BlackSemiBold.copyWith(
                    height: 1.1,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
