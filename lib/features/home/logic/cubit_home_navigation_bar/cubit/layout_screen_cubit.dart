import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store_app/features/cart/cart_screen.dart';
import 'package:store_app/features/categories/categories_screen.dart';
import 'package:store_app/features/favorites/favorites_screen.dart';

import '../../../ui/screen/home_screen_design.dart';

part 'layout_screen_state.dart';

class LayoutScreenCubit extends Cubit<LayoutScreenState> {
  LayoutScreenCubit() : super(LayoutScreenInitial());

  List<Widget> layoutScreen = [
    const HomeScreenDesign(),
    const CategoriesScreen(),
    const CartScreen(),
    const FavoritesScreen(),
  ];
  int bottomNavigationBarCurrentIndex = 0;
  void getCurrentIndex(int index) {
    bottomNavigationBarCurrentIndex = index;
    emit(CurrentIndex());
  }
}
