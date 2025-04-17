import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/home/logic/cubit_categories/cubit/products_cubit.dart';
import 'package:store_app/features/home/logic/cubit_categories/cubit/products_state.dart';
import 'package:store_app/features/home/ui/screen/products/ordering_app_category_gridview.dart';

class ProductsBloc extends StatefulWidget {
  const ProductsBloc({super.key});

  @override
  State<ProductsBloc> createState() => _CategoryBlocBuilderState();
}

class _CategoryBlocBuilderState extends State<ProductsBloc> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      buildWhen: (previous, current) =>
          current is ProductsLoading ||
          current is ProductsFailure ||
          current is ProductsSuccess,
      builder: (context, state) {
        if (state is ProductsLoading) {
          return const CircularProgressIndicator();
        }
        if (state is ProductsSuccess) {
          return OrderingAppCategoriesGridView(
              categoryList: state.listProduct ?? []);
        }
        if (state is ProductsFailure) {
          return Text(state.error.toString());
        }
        return const Center(
          child: Text(
              "It is not successful And It is not Failure And It is not loading "),
        );
      },
    );
  }
}
