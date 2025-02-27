import 'package:bloc/bloc.dart';
import 'package:store_app/features/home/data/models/products_response_model.dart';
import 'package:store_app/features/home/data/repos/all_products_repo.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final AllProductsRepo _allProductRepo;

  HomeCubit(
    this._allProductRepo,
  ) : super(const HomeState.initial());

  //AllCategories
  List<String> allCategoriesList = [];

  void getALLCategories() async {
    emit(const AllCategoriesLoading());

    final response = await _allProductRepo.getAllCategories();
    response.when(success: (allCategoriesResponseModel) {
      allCategoriesList = allCategoriesResponseModel;

      emit(AllCategoriesSuccess(allCategoriesList));
    }, failure: (error) {
      emit(AllCategoriesError(error));
    });
  }

  //category
  List<ProductsData> categoryList = [];
  void getCategory(String categoryName) async {
    emit(CategortLoading(categoryName));
    final response = await _allProductRepo.getCategory(categoryName);

    response.when(success: (categoryResponseModel) {
      categoryList = categoryResponseModel;
      emit(CategorySuccess(categoryList));
    }, failure: (error) {
      emit(CategoryError(error));
    });
  }
}
