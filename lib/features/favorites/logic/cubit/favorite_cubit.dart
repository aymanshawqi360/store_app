import 'package:bloc/bloc.dart';
import 'package:store_app/features/home/data/models/products_response_model.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  List<ProductsData> _favoriteList = [];
  List<ProductsData> _electronicsList = [];
  List<ProductsData> _jeweleryList = [];
  List<ProductsData> _mensClothingsList = [];
  List<ProductsData> _womensClothingList = [];
  Set addFavorite = {};
  int _numberProducte = 0;
  int _numberElectronics = 0;
  int _numberMensClothings = 0;
  int _numberwomensClothing = 0;
  void addFavorites(ProductsData favoriteId) {
    if (addFavorite.contains(favoriteId.id) == false) {
      switch (favoriteId.category) {
        case "electronics":
          _numberElectronics += 1;
          _electronicsList.add(favoriteId);

          print("numberElectronics =======${_numberElectronics}");
          print("electronicsList =======${_electronicsList}");
          break;
        case "jewelery":
          _womensClothingList.add(favoriteId);

          break;
        case "women's clothing":
          _numberwomensClothing += 1;
          _womensClothingList.add(favoriteId);

          print("numberwomensClothing =======${_numberwomensClothing}");
          print("womensClothingList =======${_womensClothingList}");
          break;
        case "men's clothing":
          _numberMensClothings += 1;
          _mensClothingsList.add(favoriteId);

          print("numberMensClothings =======${_numberMensClothings}");
          print("mensClothingsLists =======${_mensClothingsList}");
      }
      _numberProducte += 1;

      addFavorite.add(favoriteId.id);
      _favoriteList.add(favoriteId);
      print("addFavorite=================");
      print(addFavorite);
      print(_numberProducte);
      emit(GetFavorite(
          electronicsList: _electronicsList,
          favoriteList: _favoriteList,
          jeweleryList: _jeweleryList,
          mensClothingsList: _mensClothingsList,
          womensClothingList: _womensClothingList,
          numberElectronics: _numberElectronics,
          numberMensClothings: _numberMensClothings,
          numberProducte: _numberProducte,
          numberwomensClothing: _numberwomensClothing));
    }
  }
}
