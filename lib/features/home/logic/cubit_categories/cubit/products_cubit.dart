import 'package:bloc/bloc.dart';
import 'package:store_app/core/networking/api_result.dart';
import 'package:store_app/features/home/data/models/products_response_model.dart';
import 'package:store_app/features/home/data/repos/home_api_repo.dart';
import 'package:store_app/features/home/logic/cubit_categories/cubit/products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final HomeApiRepo _homeApiRepo;
  ProductsCubit(this._homeApiRepo) : super(ProductsInitial());

  void getProducts() async {
    if (isClosed) return;
    emit(ProductsLoading());
    final response = await _homeApiRepo.getAllProducts();
    if (isClosed) return;
    if (response is Success<List<ProductsData>>) {
      emit(ProductsSuccess(listProduct: response.data));
    } else if (response is Failure<String>) {
      if (isClosed) return;
      emit(ProductsFailure(error: response.toString()));
    }
  }

  void fetchCategories({required String category}) async {
    emit(ProductsLoading());
    final response = await _homeApiRepo.getCategory(category);

    if (response is Success<List<ProductsData>>) {
      emit(ProductsSuccess(listProduct: response.data));
    } else if (response is Failure<String>) {
      emit(ProductsFailure(error: response.toString()));
    }
  }
}
