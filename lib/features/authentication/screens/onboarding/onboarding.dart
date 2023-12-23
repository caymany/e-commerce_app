import 'package:devhub_kenya/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:devhub_kenya/features/authentication/screens/onboarding/widgets/onBoardingNextButton.dart';
import 'package:devhub_kenya/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:devhub_kenya/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:devhub_kenya/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:devhub_kenya/utils/constants/image_strings.dart';
import 'package:devhub_kenya/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());


    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: DImages.onBoardingImage1,
                title: DTexts.onBoardingTitle1,
                subTitle: DTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: DImages.onBoardingImage2,
                title: DTexts.onBoardingTitle2,
                subTitle: DTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: DImages.onBoardingImage3,
                title: DTexts.onBoardingTitle3,
                subTitle: DTexts.onBoardingSubTitle3,
              ),
            ],
          ),
          // SKip Button
          const OnBoardingSkip(),

          // Smooth Page Indicator
          const OnBoardingDotNavigation(),

          // Circular Button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}




