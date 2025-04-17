import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/home/logic/cubit_categories/cubit/products_cubit.dart';
import 'package:store_app/features/home/ui/screen/categories/container_text.dart';


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
              if (current == 0) {
                context.read<ProductsCubit>().getProducts();
              } else {
                context
                    .read<ProductsCubit>()
                    .fetchCategories(category: widget.listAllCategories[index]);
              }
            },
            child: ContainerText(
              current: current,
             listCategory: widget.listAllCategories[index],
              index: index,
            ),

           
          );
        },
      ),
    );
  }
}
