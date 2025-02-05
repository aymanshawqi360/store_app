import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/home/data/apis/home_api_constants.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class OrderingAppCategoriesList extends StatefulWidget {
  final List<String> listAllCategories;
  const OrderingAppCategoriesList({
    super.key,
    required this.listAllCategories,
  });

  @override
  State<OrderingAppCategoriesList> createState() =>
      _OrderingAppCategoriesListState();
}

class _OrderingAppCategoriesListState extends State<OrderingAppCategoriesList> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 41.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.listAllCategories.length,
          itemBuilder: (context, index) {
            length = index;
            return allCategories(index);
          }),
    );
  }

  GestureDetector allCategories(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          current = index;
        });
      },
      child: Container(
          padding: EdgeInsetsDirectional.only(start: index == 0 ? 1 : 24.w),
          child: Container(
            alignment: Alignment.center,
            width: 120.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: current == index
                    ? const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                            ColorManager.darkPurple,
                            ColorManager.royalBlue
                          ])
                    : const LinearGradient(
                        colors: [Colors.black, Colors.black])),
            child: Text("${widget.listAllCategories[index]}",
                textAlign: TextAlign.center,
                style: TextStyles.font13ghostWhiteBold),
          )),
    );
  }
}
