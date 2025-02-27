import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_response_model.g.dart';

@JsonSerializable()
class ProductsData {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;
  ProductsData(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating});
  factory ProductsData.fromJson(Map<String, dynamic> json) =>
      _$ProductsDataFromJson(json);
}

@JsonSerializable()
class Rating {
  double? rate;
  int? count;
  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
}
