import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/di/dependency_injection.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/features/cart/cart_screen.dart';
import 'package:store_app/features/cart/cubit/cart_cubit.dart';
import 'package:store_app/features/categories/categories_screen.dart';
import 'package:store_app/features/favorites/logic/cubit/favorite_cubit.dart';
import 'package:store_app/features/favorites/ui/favorites_screen.dart';
import 'package:store_app/features/home/data/apis/home_api_constants.dart';
import 'package:store_app/features/home/data/models/products_response_model.dart';
import 'package:store_app/features/home/logic/cubit/categories_cubit.dart';
import 'package:store_app/features/home/logic/cubit_categories/cubit/products_cubit.dart';
import 'package:store_app/features/favorites/layout/ui/screen/layout_screen.dart';
import 'package:store_app/features/home/ui/screen/view_details_producte/view_details_products.dart';

import 'package:store_app/features/onboarding/screen/onboarding_screen.dart';

import '../../features/home/ui/home_screen_design.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());

      case Routes.layoutScreen:
        return MaterialPageRoute(builder: (_) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => FavoriteCubit(),
              ),
            ],
            child: const LayoutScreen(),
          );
        });

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) {
          return const HomeScreenDesign();
        });
      case Routes.favoritesScreen:
        return MaterialPageRoute(
          builder: (_) => const FavoritesScreen(),
        );
      case Routes.cartScreen:
        return MaterialPageRoute(
          builder: (_) => CartScreen(),
        );

      case Routes.categoriesScreen:
        return MaterialPageRoute(
          builder: (_) => const CategoriesScreen(),
        );
      case Routes.viewDetailsProdute:
        return MaterialPageRoute(
          builder: (_) => ViewDetailsProducts(
            allProducts: arguments as ProductsData,
          ),
        );

      default:
        return null;
    }
  }
}
