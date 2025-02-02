import 'package:bloc/bloc.dart';
import 'package:store_app/core/networking/api_error_handler.dart';
import 'package:store_app/features/home/data/repos/all_categories_repo.dart';
import 'all_categories_state.dart';

class AllCategoriesCubit extends Cubit<AllCategoriesState> {
  final AllCategoriesRepo _allCategoriesRepo;
  AllCategoriesCubit(this._allCategoriesRepo)
      : super(const AllCategoriesState.initial());

  late List<String> _listAllCategories;
  int index = 0;

  void getAllCategories() async {
    emit(AllCategoriesState.allCategoriesLoading());
    final response = await _allCategoriesRepo.getAllCategories();

    response.when(success: (allCategoriesResponse) {
      _listAllCategories = allCategoriesResponse;
      index = _listAllCategories.length;
      emit(AllCategoriesState.allCategoriesSuccess(_listAllCategories));
    }, failure: (error) {
      emit(AllCategoriesState.allCategoriesError(ErrorHandler.handle(error)));
    });
  }
}
