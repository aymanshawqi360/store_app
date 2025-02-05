import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_response_model.g.dart';

@JsonSerializable()
class CategoryData {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;
  CategoryData(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating});
  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);
}

@JsonSerializable()
class Rating {
  double? rate;
  int? count;
  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
}
