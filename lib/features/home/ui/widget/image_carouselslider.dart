import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/home/ui/widget/products_offer.dart';
import '../../../../core/helpers/images_list.dart';

class ImageCarouselSlider extends StatelessWidget {
  const ImageCarouselSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: CarouselSlider.builder(
        itemCount: ImagesList.productsOfferList.length,
        options: CarouselOptions(
            height: 132.h,
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
