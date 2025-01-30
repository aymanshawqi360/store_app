import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/theming/colors.dart';

class OrderingAppCategoriesList extends StatelessWidget {
  const OrderingAppCategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 9,
          itemBuilder: (context, imdex) {
            return Container(
              padding: EdgeInsetsDirectional.only(start: imdex == 0 ? 0 : 24.w),
              child: Column(
                children: [
                  Container(
                    height: 54.h,
                    width: 54.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        border:
                            Border.all(color: ColorManager.white, width: 4)),
                  ),
                  Text(
                    "name",
                    strutStyle: StrutStyle(height: 1.6.h),
                  )
                ],
              ),
            );
          }),
    );
  }
}
