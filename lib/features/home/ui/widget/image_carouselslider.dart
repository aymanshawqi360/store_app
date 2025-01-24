import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/widget/images_list.dart';
import 'package:store_app/features/home/ui/widget/products_offer.dart';

class ImageCarouselSlider extends StatelessWidget {
  ImageCarouselSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.h),
      child: CarouselSlider.builder(
        itemCount: ImagesList.productsOfferList.length,
        options: CarouselOptions(
            height: 115.h,
            autoPlay: true,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height),
        itemBuilder: (context, index, realIndex) {
          return ProductsOffer(
            index: index,
          );
        },
      ),
    );
  }
}
