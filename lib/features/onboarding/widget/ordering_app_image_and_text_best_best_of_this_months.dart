import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                  style: TextStyles.font35WhiteSemiBold.copyWith(
                    height: 1.1,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
