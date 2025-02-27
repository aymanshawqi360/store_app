import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/home/data/apis/home_api_constants.dart';
import 'package:store_app/features/home/logic/cubit/home_cubit.dart';
import 'package:store_app/features/home/logic/cubit/home_state.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store_app/features/home/ui/widget/all_categories_list/ordering_app_all_categories_list.dart';

class AllCategoriesBlocBuilder extends StatelessWidget {
  const AllCategoriesBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is AllCategoriesLoading ||
          current is AllCategoriesSuccess ||
          current is AllCategoriesError,
      builder: (context, state) {
        return state.maybeWhen(
          allCategoriesLoading: () => _shimmerAllCategories(),
          allCategoriesSuccess: (allCategoriesResponse) {
            return OrderingAppCategoriesList(
                listAllCategories: allCategoriesResponse);
                
          },
          allCategoriesError: (errorHandler) =>
              Text(errorHandler.apiErrorModel.codeError.toString()),
          orElse: () => SizedBox.fromSize(),
        );
      },
    );
  }
}

Widget _shimmerAllCategories() {
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
