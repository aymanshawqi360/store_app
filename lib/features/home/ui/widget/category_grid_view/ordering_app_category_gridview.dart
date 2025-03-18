import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/helpers/extensions.dart';
import 'package:store_app/core/helpers/spacing.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/theming/colors.dart';
import 'package:store_app/core/theming/styles.dart';
import 'package:store_app/features/home/data/models/products_response_model.dart';
import 'package:store_app/features/home/ui/widget/category_grid_view/carts.dart';
import 'package:store_app/features/home/ui/widget/category_grid_view/favorited.dart';

class OrderingAppCategoriesGridView extends StatelessWidget {
  final List<ProductsData> categoryList;
  const OrderingAppCategoriesGridView({
    super.key,
    required this.categoryList,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 0.h),
        child: GridView.builder(
            itemCount: categoryList.length,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15.0,
                // mainAxisExtent: 170,
                mainAxisSpacing: 8.0),
            itemBuilder: (context, index) {
              final cubitList = categoryList[index];
              return Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pushNamed("${Routes.viewDetailsProdute}",
                          arguments: cubitList);
                    },
                    child: Container(
                      height: 170.h,
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: ColorManager.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          imagesAndFavorited(cubitList),
                          verticalSpace(5),
                          title(cubitList),
                          Row(children: [
                            SvgPicture.asset(
                              "assets/svgs/star.svg",
                              width: 15,
                            ),
                            horizontalSpace(2),
                            rate(cubitList)
                          ]),
                          verticalSpace(2),
                          price(cubitList),
                        ],
                      ),
                    ),
                  ),
                  Favorited(productsData: cubitList),
                  Carts(
                    productsData: cubitList,
                  )
                ],
              );
            }),
      ),
    );
  }

  Padding imagesAndFavorited(ProductsData cubitList) {
    return Padding(
      padding: EdgeInsets.only(
        right: 5.w,
      ),
      child: Stack(
        children: [
          Hero(
            tag: "${cubitList.id}",
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 8.h),
              child: CachedNetworkImage(
                  imageUrl: cubitList.image.toString(),
                  height: 57.h,
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: imageProvider,
                      )),
                      child: Padding(
                        padding: EdgeInsets.only(right: 7.w, bottom: 18.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // GestureDetector(
                            //   onTap: () {},
                            //   child: BlocBuilder<HomeCubit, HomeState>(
                            //     builder: (context, state) {
                            //       final cubit =
                            //           context.read<HomeCubit>().addFavorite;
                            //       return Image.asset(
                            //         context
                            //                 .read<HomeCubit>()
                            //                 .addFavorite
                            //                 .contains(cubitList.id)
                            //             ? "assets/images/favorite(1).png"
                            //             : "assets/images/favorite(1).png",
                            //         height: 24,
                            //         color: context
                            //                 .read<HomeCubit>()
                            //                 .addFavorite
                            //                 .contains(cubitList.id)
                            //             ? Colors.red
                            //             : Colors.black,
                            //       );
                            //     },
                            //   ),
                            // )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }

  Text title(ProductsData cubitList) {
    return Text("${cubitList.title}",
        overflow: TextOverflow.ellipsis,
        strutStyle: const StrutStyle(leading: 0.9),
        style: TextStyles.font14BlackSemiBold);
  }

  Text price(ProductsData cubitList) {
    return Text(
      "\$${cubitList.price}",
      style: TextStyles.font13DarkGrayRegular,
    );
  }

  Widget rate(ProductsData cubitList) {
    return Text(
      cubitList.rating!.rate.toString(),
    );
  }
}
