import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/routing/app_route.dart';
import 'package:store_app/core/routing/routes.dart';

class SorteApp extends StatelessWidget {
  final AppRouter appRouter;
  const SorteApp({
    super.key,
    required this.appRouter,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(414, 896),
        minTextAdapt: true,
        child: MaterialApp(
          theme: ThemeData(scaffoldBackgroundColor: const Color(0xffF2F3F7)),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.onboardingScreen,
          onGenerateRoute: appRouter.generateRoute,
        ));
  }
}
