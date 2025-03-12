import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:store_app/core/di/dependency_injection.dart';
import 'package:store_app/features/favorites/logic/cubit/favorite_cubit.dart';
import 'package:store_app/features/home/data/models/products_response_model.dart';
import 'package:store_app/features/home/logic/cubit/home_cubit.dart';
import 'package:store_app/features/home/logic/cubit/home_state.dart';
import 'package:store_app/features/home/ui/screen/home_screen_design.dart';

class Favorited extends StatelessWidget {
  final ProductsData productsData;
  const Favorited({
    super.key,
    required this.productsData,
  });

  @override
  Widget build(BuildContext context) {
    // final cubit = context.read<HomeCubit>();
    final getItFavorite = GetIt.I<FavoriteCubit>();
    return Padding(
      padding: EdgeInsets.only(right: 7.w, top: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
              onTap: () {
                // context.read<HomeCubit>().addFavorites(productsData);
                getItFavorite.addFavorites(productsData);
                // cubit.addFavorites(productsData);
                // getIt<FavoriteCubit>().addFavorites(productsData);
              },
              child: BlocBuilder<FavoriteCubit, FavoriteState>(
                bloc: getItFavorite,
                builder: (context, state) {
                  return
                      // Image.asset(
                      //   // context
                      //   //         .read<HomeCubit>()
                      //   //         .addFavorite
                      //   //         .contains(widget.productsData.id)
                      //   //     ? "assets/images/favorite(1).png"
                      //   "assets/images/favorite(1).png",
                      //   height: 24,
                      //   color: context
                      //           .read<HomeCubit>()
                      //           .addFavorite
                      //           .contains(productsData.id)
                      //       ? Colors.red
                      //       : Colors.black,
                      // );
                      Image.asset(
                    "assets/images/favorite(1).png",
                    color:
                        // context
                        //         .read<HomeCubit>()
                        //         .addFavorite
                        //         .contains(productsData.id)
                        getItFavorite.addFavorite.contains(productsData.id)
                            ? Colors.red
                            : Colors.black,
                    scale: 20,
                  );
                },
              ))
        ],
      ),
    );

    //  const Positioned(
    //   top: 5,
    //   right: 5,
    //   child: Icon(
    //     Icons.favorite_rounded,
    //   ),
    // );
  }
}
