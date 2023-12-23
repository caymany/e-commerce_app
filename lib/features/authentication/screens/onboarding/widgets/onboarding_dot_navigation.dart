import 'package:devhub_kenya/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/device/device_utility.dart';
import 'package:devhub_kenya/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = DHelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: DDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: DSizes.defaultSpace,
      child: SmoothPageIndicator(
        count: 3,
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        effect:  ExpandingDotsEffect(activeDotColor: dark ? DColors.light: DColors.dark, dotHeight: 6),
      ),
    );
  }
}