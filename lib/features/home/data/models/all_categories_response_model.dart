import 'package:freezed_annotation/freezed_annotation.dart';
part 'all_categories_response_model.g.dart';

@JsonSerializable()
class AllcategoriesResponseModel {
  String? allCategories;

  AllcategoriesResponseModel({this.allCategories});
  factory AllcategoriesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AllcategoriesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllcategoriesResponseModelToJson(this);
}
