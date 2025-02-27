import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:store_app/core/helpers/hive_service.dart';
import 'package:store_app/core/routing/app_route.dart';
import 'package:store_app/store_app.dart';

import 'core/di/dependency_injection.dart';
Box? hivee;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  
  hivee= await HiveService.initHive("length");
  runApp(StoreApp(appRouter: AppRouter()));
}
