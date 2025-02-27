import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/home/ui/widget/category_grid_view/ordering_app_category_gridview.dart';
import '../../../logic/cubit/home_cubit.dart';
import '../../../logic/cubit/home_state.dart';

class CategoryBlocBuilder extends StatefulWidget {
  CategoryBlocBuilder({super.key});

  @override
  State<CategoryBlocBuilder> createState() => _CategoryBlocBuilderState();
}

class _CategoryBlocBuilderState extends State<CategoryBlocBuilder> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<HomeCubit>(context).getCategory("electronics");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
           current is CategortLoading ||
          current is CategoryError || current is CategorySuccess,
      builder: (context, state) {
        return state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            categoryError: (errorHandler) =>
                Text(errorHandler.apiErrorModel.codeError.toString()),
            // categoryLoading: (name) {
            //   return Expanded(
            //     child: Skeletonizer(
            //       // enabled: true,
            //       child: Padding(
            //         padding:
            //             EdgeInsets.symmetric(horizontal: 8.w, vertical: 15.h),
            //         child: GridView.builder(
            //             itemCount: nameAllCategories == "electronics"
            //                 ? hivee!.get(0)
            //                 : nameAllCategories == "jewelery"
            //                     ? hivee!.get(1)
            //                     : nameAllCategories == "men's clothing"
            //                         ? hivee!.get(2)
            //                         : hivee!.get(3),

            //             // hivee!.containsKey(nameAllCategories)
            //             //     ? hivee!.get(nameAllCategories)
            //             //     : hivee!.get(nameAllCategories),

            //             // lengthCategoryGridView,
            //             // ? context.read<HomeCubit>().categoryList.length

            //             //  context.read<HomeCubit>().index,

            //             // nameAllCategories == "electronics"
            //             //     ? 6
            //             //     : nameAllCategories == "jewelery"
            //             //         ? 4
            //             //         : nameAllCategories == "men's clothing"
            //             //             ? 4
            //             //             : nameAllCategories == "men's clothing"
            //             //                 ? 6
            //             //                 : 6,
            //             // BlocProvider.of<HomeCubit>(context)
            //             //     .categoryList
            //             //     .length,
            //             padding: EdgeInsets.symmetric(
            //                 horizontal: 10.w, vertical: 5.h),
            //             gridDelegate:
            //                 const SliverGridDelegateWithFixedCrossAxisCount(
            //                     crossAxisCount: 2,
            //                     crossAxisSpacing: 15.0,
            //                     mainAxisExtent: 160,
            //                     mainAxisSpacing: 18.0),
            //             itemBuilder: (context, index) {
            //               return Stack(
            //                 children: [
            //                   Container(
            //                     padding: EdgeInsets.symmetric(
            //                         horizontal: 8.w, vertical: 5.h),
            //                     decoration: BoxDecoration(
            //                       borderRadius: BorderRadius.circular(22),
            //                       color: ColorManager.white,
            //                     ),
            //                     child: Column(
            //                       crossAxisAlignment: CrossAxisAlignment.start,
            //                       children: [
            //                         Expanded(
            //                           child: Container(
            //                             decoration: BoxDecoration(
            //                                 borderRadius:
            //                                     BorderRadius.circular(15)),
            //                             child: Padding(
            //                               padding: EdgeInsets.only(
            //                                   right: 5.w, top: 5.h),
            //                               child: Row(
            //                                   crossAxisAlignment:
            //                                       CrossAxisAlignment.start,
            //                                   mainAxisAlignment:
            //                                       MainAxisAlignment.center,
            //                                   children: [
            //                                     Container(
            //                                       padding:
            //                                           EdgeInsets.only(top: 5.h),
            //                                       // child: Image.network(
            //                                       //     height: 70,
            //                                       //     "cubitList.image"),
            //                                     ),
            //                                   ]),
            //                             ),
            //                           ),
            //                         ),
            //                         // verticalSpace(10),
            //                         Text("",
            //                             maxLines: 1,
            //                             overflow: TextOverflow.ellipsis,
            //                             strutStyle:
            //                                 const StrutStyle(leading: 0.7),
            //                             style:
            //                                 TextStyles.font14DarkGraySemiBold),
            //                         //Row(children: StarsLis.start),
            //                         Row(
            //                           children: [
            //                             SvgPicture.asset(
            //                               "assets/svgs/star.svg",
            //                               width: 16,
            //                             ),
            //                             Text("")
            //                           ],
            //                         ),
            //                         Text(
            //                           "",
            //                           strutStyle:
            //                               const StrutStyle(leading: 1.2),
            //                           style: TextStyles.font16DarkGraySemiBold,
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                   //     const Carts(),
            //                   const Favorited(),
            //                 ],
            //               );
            //               // return Container(
            //               //   width: 120.w,
            //               //   decoration: BoxDecoration(
            //               //       color: Colors.white,
            //               //       borderRadius: BorderRadius.circular(22)),
            //               // );
            //               // return Container(
            //               //   child: Shimmer.fromColors(
            //               //       baseColor: Colors.grey.shade300,
            //               //       highlightColor: Colors.grey.shade100,
            //               //       child: Container(
            //               //         width: 120.w,
            //               //         decoration: BoxDecoration(
            //               //             color: Colors.white,
            //               //             borderRadius: BorderRadius.circular(22)),
            //               //       )),
            //               // );
            //             }),
            //       ),
            //     ),
            //   );
            // },
            categorySuccess: (categoryListResponsModel) {
              return OrderingAppCategoriesGridView(
                  categoryList: categoryListResponsModel);
            });
      },
    );
  }
}

