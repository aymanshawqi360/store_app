import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/helpers/app_assets.dart';
import 'package:store_app/features/favorites/logic/cubit/favorite_cubit.dart';
import 'package:store_app/features/home/data/models/products_response_model.dart';

class Favorited extends StatelessWidget {
  final ProductsData productsData;
  const Favorited({
    super.key,
    required this.productsData,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        final cubitFavorite = context.read<FavoriteCubit>();
        return Padding(
          padding: EdgeInsets.only(right: 7.w, top: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: () {
                    cubitFavorite.addFavorite(productsData);
                  },
                  child: Image.asset(
                    cubitFavorite.caheckData.contains(productsData.id)
                        ? AppAssets.favoriteOne
                        : AppAssets.favoriteOne,
                    color: cubitFavorite.caheckData.contains(productsData.id)
                        ? Colors.red
                        : Colors.black,
                    scale: 20,
                  )),
            ],
          ),
        );
      },
    );
  }
}
