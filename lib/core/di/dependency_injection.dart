import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:store_app/core/networking/api_factore.dart';
import 'package:store_app/features/cart/cubit/cart_cubit.dart';

import 'package:store_app/features/favorites/logic/cubit/favorite_cubit.dart';
import 'package:store_app/features/home/data/apis/home_api_service.dart';
import 'package:store_app/features/home/data/repos/all_products_repo.dart';
import 'package:store_app/features/home/logic/cubit/home_cubit.dart';
import 'package:store_app/features/home/logic/cubit_layout_navigation/cubit/layout_screen_cubit.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  //Dio
  Dio dio = ApiFactore.getDio();
  //AllHomeApiService
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<AllProductsRepo>(() => AllProductsRepo(getIt()));
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt()));

  //Favorite
  getIt.registerLazySingleton<FavoriteCubit>(() => FavoriteCubit());

  // LayoutScreen
  // getIt.registerLazySingleton<LayoutScreenCubit>(() => LayoutScreenCubit());

  //ProductsCart
  getIt.registerLazySingleton<CartCubit>(() => CartCubit());
  //getIt.registerFactory<CartCubit>(() => CartCubit());
}
