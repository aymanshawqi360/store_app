import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/home/logic/cubit/home_cubit.dart';
import 'package:store_app/features/home/logic/cubit/home_state.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store_app/features/home/ui/widget/all_categories_list/ordering_app_all_categories_list.dart';

class AllCategoriesBlocBuilder extends StatefulWidget {
  const AllCategoriesBlocBuilder({
    super.key,
  });

  @override
  State<AllCategoriesBlocBuilder> createState() =>
      _AllCategoriesBlocBuilderState();
}

class _AllCategoriesBlocBuilderState extends State<AllCategoriesBlocBuilder> {
  @override
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<HomeCubit>(context).getALLCategories();
    super.initState();
  }

  List<String> allCategoriesResponse = [];
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
            return OrderingAppAllCategoriesList(
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
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsetsDirectional.only(start: index == 0 ? 1 : 24.w),
            child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: 115,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                )),
          );
        }),
  );
}
