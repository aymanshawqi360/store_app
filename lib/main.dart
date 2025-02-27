import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/routing/app_route.dart';
import 'package:store_app/sorte_app.dart';

import 'core/di/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  runApp(SorteApp(appRouter: AppRouter()));
}
