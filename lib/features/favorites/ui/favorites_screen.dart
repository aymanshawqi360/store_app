import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:store_app/core/helpers/spacing.dart';
import 'package:store_app/core/widget/view_details_products.dart';
import 'package:store_app/features/favorites/logic/cubit/favorite_cubit.dart';
import 'package:store_app/features/favorites/ui/screen/list_view_all_favorites.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      bloc: GetIt.I<FavoriteCubit>(),
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Favorites"),
                              Container(
                                alignment: Alignment.center,
                                height: 25.h,
                                width: 35.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                                child: Text(
                                  "${state is GetFavorite ? state.numberProducte : 0}",
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("electronics"),
                              Container(
                                alignment: Alignment.center,
                                height: 25.h,
                                width: 35.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                                child: Text(
                                  "${state is GetFavorite ? state.numberElectronics : 0}",
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("women's clothing"),
                              Container(
                                alignment: Alignment.center,
                                height: 25.h,
                                width: 35.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                                child: Text(
                                  "${state is GetFavorite ? state.numberwomensClothing : 0}",
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("mensClothings"),
                              Container(
                                alignment: Alignment.center,
                                height: 25.h,
                                width: 35.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                                child: Text(
                                  "${state is GetFavorite ? state.numberMensClothings : 0}",
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(10),
                          const DividerViewDetailsProducte(
                            dividerColor: Colors.grey,
                            dividerEndIndent: 1.0,
                            dividerThickness: 0.6,
                            dividerIndent: 1.0,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("FAVORITES"),
                              Text("show all"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(20),
                    ListViewAllFavorite(
                      listProducte:
                          state is GetFavorite ? state.favoriteList : [],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("FOR ELECTRONICS"),
                        Text("show all"),
                      ],
                    ),
                    verticalSpace(20),
                    ListViewAllFavorite(
                      listProducte:
                          state is GetFavorite ? state.electronicsList : [],
                    ),
                    verticalSpace(20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("FOR WOMEN"),
                        Text("show all"),
                      ],
                    ),
                    verticalSpace(10),
                    ListViewAllFavorite(
                      listProducte:
                          state is GetFavorite ? state.womensClothingList : [],
                    ),
                    verticalSpace(20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("FOR MEN"),
                        Text("show all"),
                      ],
                    ),
                    verticalSpace(10),
                    ListViewAllFavorite(
                      listProducte:
                          state is GetFavorite ? state.mensClothingsList : [],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
