import 'package:bloc/bloc.dart';
import 'package:store_app/core/networking/api_result.dart';
import 'package:store_app/features/home/data/models/products_response_model.dart';
import 'package:store_app/features/home/data/repos/home_api_repo.dart';

import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final HomeApiRepo _homeApiRepo;

  CategoriesCubit(
    this._homeApiRepo,
  ) : super(Catedoriesinitial());

  //AllCategories
  List<String> allCategoriesList = [];

  void getALLCategories() async {
    emit(CatedoriesLoading());

    final response = await _homeApiRepo.getAllCategories();
    if (response is Success<List<String>>) {
      response.data.insert(0, "All");
      emit(CatedoriesSuccess(listCatedories: response.data));
    } else if (response is Failure<String>) {
      emit(CatedoriesFailure(error: response.toString()));
    }
  }
}
