import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/theming/colors.dart';
import 'package:store_app/core/theming/styles.dart';
import 'package:store_app/features/home/ui/screen/categories/container_text.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       
        body: Container(
          height: 100.h,
          width: double.infinity,
          color: ColorManager.white,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Row(
                  children: [
                    Text(
                      "Favorite",
                      style: TextStyles.font24blackBold,
                    ),
                  ],
                ),
              ),
              SizedBox(
                  height: 25.h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return ContainerText(
                          index: 5,
                          listCategory: "",
                          current: 1,
                          borderRadiusGeometry: BorderRadius.circular(8),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
