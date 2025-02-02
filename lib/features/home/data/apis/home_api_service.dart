import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:store_app/core/networking/api_constants.dart';
import 'package:store_app/features/home/data/apis/home_api_constants.dart';
part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String? baseUrl}) = _HomeApiService;

  @GET(HomeApiConstants.allCategories)
  Future<List<String>> getAllCategories();
}
