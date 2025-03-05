import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/core/helpers/extensions.dart';
import 'package:store_app/core/helpers/spacing.dart';
import 'package:store_app/core/theming/colors.dart';
import 'package:store_app/features/home/ui/widget/view_details_producte/bottom_add_to_cart.dart';
import 'package:store_app/features/home/ui/widget/view_details_producte/divider_view_details_producte.dart';

import '../../../../../core/theming/styles.dart';
import '../../../data/models/products_response_model.dart';

class ViewDetailsProducts extends StatefulWidget {
  final ProductsData allProducts;
  const ViewDetailsProducts({
    Key? key,
    required this.allProducts,
  }) : super(key: key);

  @override
  State<ViewDetailsProducts> createState() => _ViewDetailsProductsState();
}

class _ViewDetailsProductsState extends State<ViewDetailsProducts>
    with SingleTickerProviderStateMixin {
  bool up = false;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
      reverseDuration: const Duration(milliseconds: 2300),
    )..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) controller.reverse();
        if (status == AnimationStatus.dismissed) controller.forward();
      });

    controller.forward();
  }

  @override
  void dispose() {
    // Dispose of the AnimationController
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                      color: ColorManager.ghostWhite,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 30,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.h),
                child: SizedBox(
                  height: 200.h,
                  width: double.infinity,
                  child: SlideTransition(
                      position: Tween<Offset>(
                              begin: const Offset(0, -0.1),
                              end: const Offset(0, 0.24))
                          .animate(controller),
                      child: Hero(
                        tag: "${widget.allProducts.id}",
                        child: CachedNetworkImage(
                          imageUrl: widget.allProducts.image.toString(),
                          imageBuilder: (context, imageProvider) {
                            return Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                ),
                              ),
                            );
                          },
                        ),
                      )),
                ),
              ),
              // verticalSpace(10),
              Column(
                children: [
                  titleProducte(),
                  verticalSpace(15),
                  Row(children: [
                    SvgPicture.asset(
                      "assets/svgs/star.svg",
                      width: 16,
                    ),
                    horizontalSpace(4),
                    rateProducte(),
                    horizontalSpace(8),
                    reviewsProducte()
                  ]),
                  verticalSpace(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      price(),
                      Container(
                        height: 40.h,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 8,
                                offset: const Offset(1, 1),
                              ),
                            ],
                            color: ColorManager.ghostWhite,
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset(
                          "assets/images/favorite(2).png",
                          scale: 19,
                        ),
                      )
                    ],
                  ),
                  verticalSpace(20),
                  const DividerViewDetailsProducte(
                    dividerColor: Colors.grey,
                    dividerEndIndent: 1,
                    dividerIndent: 1,
                    dividerThickness: 0.7,
                  ),
                  verticalSpace(10),
                  descriptionProducte(),
                ],
              ),

              const BottomAddToCart()
            ],
          ),
        ),
      ),
    ));
  }

  Row titleProducte() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            "${widget.allProducts.title}",
            style: TextStyles.font15BlackRegular,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
      ],
    );
  }

  Text rateProducte() {
    return Text(widget.allProducts.rating!.rate.toString(),
        style: TextStyles.font17BlackBold);
  }

  Text reviewsProducte() {
    return Text(
      "(${widget.allProducts.rating!.count.toString()} Reviews )",
      style: TextStyles.font14DarkGrayRegular,
    );
  }

  Text descriptionProducte() {
    return Text(
      "${widget.allProducts.description}",
      maxLines: 9,
      overflow: TextOverflow.ellipsis,
      // strutStyle: const StrutStyle(height: 0),
      style: TextStyles.font15SilverGrayLight,
    );
  }

  Text price() {
    return Text("\$${widget.allProducts.price}",
        style: TextStyles.font16blackBold);
  }
}
