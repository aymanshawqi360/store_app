import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/home/logic/cubit/home_cubit.dart';
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
      height: 37.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.listAllCategories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                current = index;
              });
              context
                  .read<HomeCubit>()
                  .getCategory(widget.listAllCategories[index]);
            },
            child: Container(
                padding:
                    EdgeInsetsDirectional.only(start: index == 0 ? 1 : 24.w),
                child: Container(
                  alignment: Alignment.center,
                  width: 150.w,
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
                      style: TextStyles.font13ghostWhiteMedium),
                )),
          );
        },
      ),
    );
  }
}
