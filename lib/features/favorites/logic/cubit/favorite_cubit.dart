import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:store_app/features/home/data/models/products_response_model.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  
  Set caheckData = {};
  

  void addFavorite(ProductsData productData) {
    if (!caheckData.contains(productData.id)) {
      caheckData.add(productData.id);
      log("successFully========${caheckData}");
    }
    emit(SaveFavorite());
  }
 }
