import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/core/networking/api_error_handler.dart';

import '../../data/models/category_response_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  //AllCategories
  const factory HomeState.allCategoriesLoading() = AllCategoriesLoading;
  const factory HomeState.allCategoriesSuccess(List<String> allCategoriesList) =
      AllCategoriesSuccess;
  const factory HomeState.allCategoriesError(ErrorHandler errorHandler) =
      AllCategoriesError;

  //Category
  const factory HomeState.categoryLoading() = CategortLoading;
  const factory HomeState.categorySuccess(List<CategoryData> categoryLisr) =
      CategorySuccess;
  const factory HomeState.categoryError(ErrorHandler errorHandler) =
      CategoryError;
}
