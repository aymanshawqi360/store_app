import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/home/logic/cubit/categories_cubit.dart';
import 'package:store_app/features/home/logic/cubit/categories_state.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store_app/features/home/ui/screen/categories/ordering_app_all_categories_list.dart';

class CategoriesBloc extends StatefulWidget {
  const CategoriesBloc({
    super.key,
  });

  @override
  State<CategoriesBloc> createState() => _AllCategoriesBlocBuilderState();
}

class _AllCategoriesBlocBuilderState extends State<CategoriesBloc> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CatedoriesLoading) {
          return Center(child: _shimmerAllCategories());
        }
        if (state is CatedoriesSuccess) {
          return OrderingAppCategoriesList(
              listAllCategories: state.listCatedories ?? []);
        }
        if (state is CatedoriesFailure) {
          return Center(child: Text(state.error.toString()));
        }

        return const Center(
          child: Text(
              "It is not successful And It is not Failure And It is not loading "),
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
