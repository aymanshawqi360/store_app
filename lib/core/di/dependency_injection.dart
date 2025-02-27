import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:store_app/core/networking/api_factore.dart';
import 'package:store_app/features/home/data/apis/home_api_service.dart';
import 'package:store_app/features/home/data/repos/all_categories_repo.dart';
import 'package:store_app/features/home/data/repos/category_repo.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  //Dio
  Dio dio = ApiFactore.getDio();
  //AllHomeApiService
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  //AllCategories
  getIt.registerLazySingleton<AllCategoriesRepo>(
      () => AllCategoriesRepo(getIt()));

  //Category
  getIt.registerLazySingleton<CategoryRepo>(() => CategoryRepo(getIt()));
}
