import 'package:store_app/core/networking/api_error_handler.dart';
import 'package:store_app/core/networking/api_result.dart';
import 'package:store_app/features/home/data/apis/home_api_service.dart';

import '../models/category_response_model.dart';

class CategoryRepo {
  final HomeApiService _homeApiService;

  CategoryRepo(this._homeApiService);

  Future<ApiResult<List<CategoryData>>> getCategory(String categoryName) async {
    try {
      final response = await _homeApiService.getCategeory(categoryName);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
