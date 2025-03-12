import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/helpers/spacing.dart';
import 'package:store_app/features/home/data/models/products_response_model.dart';

class ListViewAllFavorite extends StatelessWidget {
  final List<ProductsData> listProducte;

  const ListViewAllFavorite({
    super.key,
    required this.listProducte,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170.h,
      child: ListView.builder(
          itemCount: listProducte.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final listCubit = listProducte[index];
            return Container(
              width: 140.w,
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.white70,
              ),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.0.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: CachedNetworkImage(
                          imageUrl: listCubit.image.toString(),
                          height: 60.h,
                          imageBuilder: (context, imageProvider) {
                            return Image(image: imageProvider);
                          }),
                    ),
                    verticalSpace(10),
                    Text(
                      "${listCubit.title}",
                      maxLines: 2,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    verticalSpace(5),
                    Text("\$${listCubit.price}")
                  ],
                ),
              ),
            );
          }),
    );
  }
}
