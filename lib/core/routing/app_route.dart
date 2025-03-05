import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/features/categories/categories_screen.dart';
import 'package:store_app/features/favorites/favorites_screen.dart';
import 'package:store_app/features/home/data/models/products_response_model.dart';
import 'package:store_app/features/home/logic/cubit_home_navigation_bar/cubit/layout_screen_cubit.dart';
import 'package:store_app/features/home/ui/screen/layout_screen.dart';
import 'package:store_app/features/home/ui/widget/view_details_producte/view_details_products.dart';

import 'package:store_app/features/onboarding/screen/onboarding_screen.dart';

import '../../features/home/ui/screen/home_screen_design.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case Routes.homeNavigationBar:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) {
                    return LayoutScreenCubit();
                  },
                  child: const LayoutScreen(),
                ));
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreenDesign(),
        );

      case Routes.cartScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreenDesign(),
        );
      case Routes.favoritesScreen:
        return MaterialPageRoute(
          builder: (context) => const FavoritesScreen(),
        );
      case Routes.categoriesScreen:
        return MaterialPageRoute(
          builder: (context) => const CategoriesScreen(),
        );
      case Routes.viewDetailsProdute:
        return MaterialPageRoute(
          builder: (context) => ViewDetailsProducts(
            allProducts: arguments as ProductsData,
          ),
        );

      default:
        return null;
    }
  }
}
