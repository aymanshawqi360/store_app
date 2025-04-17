import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/theming/colors.dart';
import 'package:store_app/core/theming/styles.dart';

class ContainerText extends StatelessWidget {
  final int index;
  final int current;
  
  final BorderRadiusGeometry? borderRadiusGeometry;
  final String listCategory;
  const ContainerText({
    super.key,
    required this.index,
    this.borderRadiusGeometry,
    required this.current,
    required this.listCategory,
  });

  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 8.w, start: index == 0 ? 8 : 0),
      child: Container(
        // width: 51.w,
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: borderRadiusGeometry ??BorderRadius.circular(8),
            gradient: current == index
                ? const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [ColorManager.darkPurple, ColorManager.royalBlue])
                : const LinearGradient(colors: [Colors.black, Colors.black])),
        child: Text(
          style: TextStyles.font16ghostWhiteMedium,
          listCategory,
        ),
      ),
    );
  }
}
