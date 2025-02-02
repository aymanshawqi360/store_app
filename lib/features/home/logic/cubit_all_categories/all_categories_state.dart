import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/core/networking/api_error_handler.dart';

part 'all_categories_state.freezed.dart';

@freezed
class AllCategoriesState with _$AllCategoriesState {
  const factory AllCategoriesState.initial() = _Initial;
  const factory AllCategoriesState.allCategoriesLoading() =
      AllCategoriesLoading;
  const factory AllCategoriesState.allCategoriesSuccess(
      List<String> listAllCategories) = AllCategoriesSuccess;
  const factory AllCategoriesState.allCategoriesError(
      ErrorHandler errorHandler) = AllCategoriesError;
}
