import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/theming/colors.dart';
import 'package:store_app/core/theming/font_weight_helper%20.dart';

class TextStyles {
  static TextStyle font20BlackSemiBold = TextStyle(
    color: ColorManager.Black,
    fontWeight: FontWeightHelper.semiBold,
    fontSize: 20.sp,
  );
  static TextStyle font35BlackSemiBold = TextStyle(
    color: ColorManager.Black,
    fontWeight: FontWeightHelper.semiBold,
    fontSize: 35.sp,
  );
  static TextStyle font35WhiteSemiBold = TextStyle(
    color: ColorManager.white,
    fontWeight: FontWeightHelper.semiBold,
    fontSize: 35.sp,
  );
}
