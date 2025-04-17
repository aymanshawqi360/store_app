import 'dart:math';

import 'package:dio/dio.dart';
import 'package:store_app/core/networking/api_error_handler.dart';
import 'package:store_app/core/networking/api_result.dart';
import 'package:store_app/features/home/data/apis/home_api_service.dart';

import '../models/products_response_model.dart';

class HomeApiRepo {
  final HomeApiService _homeApiService;

  HomeApiRepo(this._homeApiService);

  // AllCategories
  Future<ApiResult<List<String>>> getAllCategories() async {
    try {
      final response = await _homeApiService.getAllCategories();
      print("===================${response}");
      return ApiResult.success(response);
    } on DioException catch (error) {
      return ApiResult.failure(error.response!.data);
    }
  }

  //Category
  Future<ApiResult<List<ProductsData>>> getCategory(String categoryName) async {
    try {
      final response = await _homeApiService.getCategeory(categoryName);
      print(response);
      return ApiResult.success(response);
    } on DioException catch (error) {
      return ApiResult.failure(error.response!.data);
    }
  }

  //AllProducts
  Future<ApiResult<List<ProductsData>>> getAllProducts() async {
    try {
      final response = await _homeApiService.getAllProducts();
      return ApiResult.success(response);
    } on DioException catch (error) {
      return ApiResult.failure(error.response!.data);
    }
  }
}
