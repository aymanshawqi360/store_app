import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:store_app/core/networking/api_factore.dart';
import 'package:store_app/features/cart/cubit/cart_cubit.dart';

import 'package:store_app/features/favorites/logic/cubit/favorite_cubit.dart';
import 'package:store_app/features/home/data/apis/home_api_service.dart';
import 'package:store_app/features/home/data/repos/home_api_repo.dart';
import 'package:store_app/features/home/logic/cubit/categories_cubit.dart';
import 'package:store_app/features/home/logic/cubit_categories/cubit/products_cubit.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  //Dio
  Dio dio = ApiFactore.getDio();

  // getIt.registerSingleton<ApiFactore>(dio);
  //Home//

  //Categories
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeApiRepo>(() => HomeApiRepo(getIt()));
  getIt.registerFactory<CategoriesCubit>(() => CategoriesCubit(getIt()));

  //Products
  getIt.registerFactory<ProductsCubit>(() => ProductsCubit(getIt()));
  //getIt.registerLazySingleton<ProductsCubit>(() => ProductsCubit(getIt()));

  //Favorite
  // getIt.registerLazySingleton<FavoriteCubit>(() => FavoriteCubit());

  //ProductsCart

  getIt.registerFactory<CartCubit>(() => CartCubit());
}
