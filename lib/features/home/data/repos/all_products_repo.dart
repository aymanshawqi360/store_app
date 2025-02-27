import 'package:store_app/core/networking/api_error_handler.dart';
import 'package:store_app/core/networking/api_result.dart';
import 'package:store_app/features/home/data/apis/home_api_service.dart';


import '../models/products_response_model.dart';

class AllProductsRepo {
  final HomeApiService _homeApiService;

  AllProductsRepo(this._homeApiService);

  // AllCategories
  Future<ApiResult<List<String>>> getAllCategories() async {
    try {
      final response = await _homeApiService.getAllCategories();

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  //Category
  Future<ApiResult<List<ProductsData>>> getCategory(String categoryName) async {
    try {
      final response = await _homeApiService.getCategeory(categoryName);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  //AllProducts
  Future<ApiResult<List<ProductsData>>> getAllProducts() async {
    try {
      final response = await _homeApiService.getAllProducts();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
