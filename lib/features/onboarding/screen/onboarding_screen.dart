import 'package:flutter/material.dart';
import 'package:store_app/features/onboarding/widget/onboarding_smooth_pageIndicator.dart';
import '../widget/ordering_app_image_and_text_best_best_of_this_months.dart';
import '../widget/ordering_app_image_and_text_best_summer.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: controller,
              children: [
                OrderingAppImageAndTextBestSummer(
                    image: "assets/images/onboarding_ordering_app_one.png"),
                OrderingAppImageAndTextBestOfThisMonths(
                    image: "assets/images/onboarding_ordering_app_two.png"),
              ],
            ),
            OnboardingSmoothPageindicator(
              controller: controller,
              count: 2,
            )
          ],
        ),
      ),
    );
  }
}
