import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:store_app/core/networking/api_constants.dart';
import 'package:store_app/features/home/data/apis/home_api_constants.dart';


import '../models/products_response_model.dart';
part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String? baseUrl}) = _HomeApiService;

  @GET(HomeApiConstants.allCategories)
  Future<List<String>> getAllCategories();

  @GET('${HomeApiConstants.catgegory}/{category_name}')
  Future<List<ProductsData>> getCategeory(
      @Path('category_name') String categoryName);

  @GET(HomeApiConstants.allProducts)
  Future<List<ProductsData>> getAllProducts();
}
