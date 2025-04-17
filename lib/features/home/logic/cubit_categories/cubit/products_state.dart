import 'package:store_app/features/home/data/models/products_response_model.dart';

abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsSuccess extends ProductsState {
  final List<ProductsData>? listProduct;
  ProductsSuccess({this.listProduct});
}

class ProductsFailure extends ProductsState {
  final String? error;
  ProductsFailure({this.error});
}
