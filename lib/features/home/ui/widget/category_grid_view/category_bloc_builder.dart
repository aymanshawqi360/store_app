import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/home/ui/widget/category_grid_view/ordering_app_category_gridview.dart';

import '../../../logic/cubit/home_cubit.dart';
import '../../../logic/cubit/home_state.dart';

class CategoryBlocBuilder extends StatefulWidget {
  const CategoryBlocBuilder({super.key});

  @override
  State<CategoryBlocBuilder> createState() => _CategoryBlocBuilderState();
}

class _CategoryBlocBuilderState extends State<CategoryBlocBuilder> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<HomeCubit>(context)..getCategory("electronics");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is CategortLoading ||
          current is CategoryError ||
          current is CategorySuccess,
      builder: (context, state) {
        return state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            categoryError: (errorHandler) =>
                Text(errorHandler.apiErrorModel.codeError.toString()),
            categoryLoading: () => Center(child: CircularProgressIndicator()),
            categorySuccess: (categoryList) {
              return OrderingAppCategoriesGridView(categoryList: categoryList);
            });
      },
    );
  }
}
