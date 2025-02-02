import 'package:store_app/core/networking/api_error_handler.dart';
import 'package:store_app/core/networking/api_result.dart';
import 'package:store_app/features/home/data/apis/home_api_service.dart';

class AllCategoriesRepo {
  final HomeApiService _homeApiService;

  AllCategoriesRepo(this._homeApiService);

  Future<ApiResult<List<String>>> getAllCategories() async {
    try {
      final response = await _homeApiService.getAllCategories();

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
