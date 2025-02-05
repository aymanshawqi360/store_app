import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/di/dependency_injection.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/features/home/logic/cubit/home_cubit.dart';

import 'package:store_app/features/home/ui/screen/home_screen_design.dart';
import 'package:store_app/features/onboarding/screen/onboarding_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());

      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) {
                    return HomeCubit(getIt(), getIt())..getALLCategories();
                  },
                  child: const HomeScreenDesign(),
                ));

      default:
        return null;
    }
  }
}
