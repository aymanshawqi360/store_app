import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/helpers/app_assets.dart';
import 'package:store_app/core/helpers/extensions.dart';
import 'package:store_app/core/helpers/spacing.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/theming/colors.dart';
import 'package:store_app/core/theming/styles.dart';
import 'package:store_app/features/home/data/models/products_response_model.dart';
import 'package:store_app/features/home/logic/cubit_categories/cubit/products_cubit.dart';
import 'package:store_app/features/home/ui/screen/products/carts.dart';
import 'package:store_app/features/home/ui/screen/products/favorited.dart';

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
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<ProductsCubit>().getProducts();
          },
          child: GridView.builder(
              itemCount: categoryList.length,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14.0,
                  mainAxisExtent: 210,
                  mainAxisSpacing: 15),
              itemBuilder: (context, index) {
                final cubitList = categoryList[index];
                return Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.pushNamed(Routes.viewDetailsProdute,
                            arguments: cubitList);
                      },
                      child: Container(
                        //  height: 170.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 5.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: ColorManager.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            imagesAndFavorited(cubitList, context),
                            verticalSpace(14),
                            title(cubitList),
                            Row(children: [
                              SvgPicture.asset(
                                AppAssets.starSvg,
                                width: 15,
                              ),
                              horizontalSpace(2),
                              rate(cubitList)
                            ]),
                            verticalSpace(4),
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
      ),
    );
  }

  Padding imagesAndFavorited(ProductsData cubitList, BuildContext context) {
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
                margin: EdgeInsets.only(top: 10.h),
                child: SizedBox(
                  height: 100.h,
                  width: 150.w,
                  child: CachedNetworkImage(
                    imageUrl: cubitList.image.toString(),
                    errorWidget: (context, url, error) {
                      return Icon(
                        Icons.wifi_tethering_error_rounded_sharp,
                        color: Colors.red,
                        size: 50.sp,
                      );
                    },
                  ),
                )),
          ),
        ],
      ),
    );
  }

  Text title(ProductsData cubitList) {
    return Text("${cubitList.title}",
        overflow: TextOverflow.ellipsis,
        strutStyle: const StrutStyle(leading: 0.9),
        style: TextStyles.font15BlackSemiBold);
  }

  Text price(ProductsData cubitList) {
    return Text(
      "\$${cubitList.price}",
      style: TextStyles.font15DarkGrayRegular,
    );
  }

  Widget rate(ProductsData cubitList) {
    return Text(
      cubitList.rating!.rate.toString(),
    );
  }
}
