import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/routing/app_route.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/theming/colors.dart';

class SorteApp extends StatelessWidget {
  final AppRouter appRouter;
  const SorteApp({
    super.key,
    required this.appRouter,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        child: MaterialApp(
          theme: ThemeData(scaffoldBackgroundColor: ColorManager.lightGray),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.onboardingScreen,
          onGenerateRoute: appRouter.generateRoute,
        ));
  }
}
