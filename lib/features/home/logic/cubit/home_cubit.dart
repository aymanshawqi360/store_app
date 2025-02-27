import 'package:bloc/bloc.dart';
import 'package:store_app/features/home/data/models/category_response_model.dart';
import 'package:store_app/features/home/data/repos/all_categories_repo.dart';
import 'package:store_app/features/home/data/repos/category_repo.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final AllCategoriesRepo _allCategoriesRepo;
  final CategoryRepo _categoryRepo;
  HomeCubit(
    this._allCategoriesRepo,
    this._categoryRepo,
  ) : super(const HomeState.initial());

  //AllCategories
  List<String> _allCategoriesList = [];
  void getALLCategories() async {
    emit(const AllCategoriesLoading());
    final response = await _allCategoriesRepo.getAllCategories();
    response.when(success: (allCategoriesResponseModel) {
      _allCategoriesList = allCategoriesResponseModel;
      emit(AllCategoriesSuccess(_allCategoriesList));
    }, failure: (error) {
      emit(AllCategoriesError(error));
    });
  }

  //category
  List<CategoryData> _categoryList = [];
  void getCategory(String categoryName) async {
    emit(const CategortLoading());
    final response = await _categoryRepo.getCategory(categoryName);
    response.when(success: (categoryResponseModel) {
      _categoryList = categoryResponseModel;
      emit(CategorySuccess(_categoryList));
    }, failure: (error) {
      emit(CategoryError(error));
    });
  }
}
