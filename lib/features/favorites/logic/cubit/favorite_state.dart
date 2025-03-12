part of 'favorite_cubit.dart';

abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class GetFavorite extends FavoriteState {
  final List<ProductsData> favoriteList;
  final List<ProductsData> electronicsList;
  final List<ProductsData> jeweleryList;
  final List<ProductsData> mensClothingsList;
  final List<ProductsData> womensClothingList;
  final int numberProducte;
  final int numberElectronics;
  final int numberMensClothings;
  final int numberwomensClothing;

  GetFavorite(
      {required this.favoriteList,
      required this.numberProducte,
      required this.numberElectronics,
      required this.numberMensClothings,
      required this.numberwomensClothing,
      required this.electronicsList,
      required this.jeweleryList,
      required this.mensClothingsList,
      required this.womensClothingList});
}
