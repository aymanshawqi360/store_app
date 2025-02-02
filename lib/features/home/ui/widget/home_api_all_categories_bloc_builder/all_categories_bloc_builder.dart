import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/home/data/apis/home_api_constants.dart';
import 'package:store_app/features/home/logic/cubit_all_categories/all_categories_cubit.dart';
import 'package:store_app/features/home/logic/cubit_all_categories/all_categories_state.dart';
import 'package:shimmer/shimmer.dart';

import '../ordering_app_categories_list.dart';

class AllCategoriesBlocBuilder extends StatelessWidget {
  const AllCategoriesBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCategoriesCubit, AllCategoriesState>(
      buildWhen: (previous, current) =>
          current is AllCategoriesLoading || current is AllCategoriesSuccess,
      builder: (context, state) {
        return state.maybeWhen(
            orElse: () => SizedBox.fromSize(),
            allCategoriesLoading: () {
              return shimmerAllCategories();
            },
            allCategoriesSuccess: (allCategoriesResponse) {
              return OrderingAppCategoriesList(
                  listAllCategories: allCategoriesResponse);
            });
      },
    );
  }
}

Widget shimmerAllCategories() {
  return SizedBox(
    height: 40.h,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsetsDirectional.only(start: index == 0 ? 1 : 24.w),
            child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: 120.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                )),
          );
        }),
  );
}
