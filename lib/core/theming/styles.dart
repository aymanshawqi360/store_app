import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/theming/colors.dart';
import 'package:store_app/core/theming/font_weight_helper%20.dart';

class TextStyles {
  static TextStyle font20BlackSemiBold = TextStyle(
    color: ColorManager.black,
    fontWeight: FontWeightHelper.semiBold,
    fontSize: 20.sp,
  );
  static TextStyle font35BlackSemiBold = TextStyle(
    color: ColorManager.black,
    fontWeight: FontWeightHelper.semiBold,
    fontSize: 35.sp,
  );
  static TextStyle font30WhiteSemiBold = TextStyle(
    color: ColorManager.white,
    fontWeight: FontWeightHelper.semiBold,
    fontSize: 30.sp,
  );
  static TextStyle font14DarkGraySemiBold = TextStyle(
    color: ColorManager.darkGray,
    fontWeight: FontWeightHelper.semiBold,
    fontSize: 14.sp,
  );
  static TextStyle font12DarkGraySemiBold = TextStyle(
    color: ColorManager.darkGray,
    fontWeight: FontWeightHelper.semiBold,
    fontSize: 12.sp,
  );
  static TextStyle font10BlackSemiBold = TextStyle(
    color: ColorManager.black,
    fontWeight: FontWeightHelper.semiBold,
    fontSize: 10.sp,
  );
  static TextStyle font14SlateGrayLight = TextStyle(
    color: ColorManager.slateGray,
    fontWeight: FontWeightHelper.light,
    fontSize: 14.sp,
  );
  static TextStyle font13DarkPurpleMedium = TextStyle(
    color: ColorManager.darkPurple,
    fontWeight: FontWeightHelper.medium,
    fontSize: 12.sp,
  );
}
