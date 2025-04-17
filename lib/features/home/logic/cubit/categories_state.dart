abstract class CategoriesState {}

class Catedoriesinitial extends CategoriesState {}

class CatedoriesLoading extends CategoriesState {}

class CatedoriesSuccess extends CategoriesState {
  final List<String>? listCatedories;
  CatedoriesSuccess({this.listCatedories});
}

class CatedoriesFailure extends CategoriesState {
  final String? error;
  CatedoriesFailure({this.error});
}
