import 'dart:async';

import 'package:devhub_kenya/common/widgets/success_screen/success_screen.dart';
import 'package:devhub_kenya/data/repositories/authentication/authentication_repository.dart';
import 'package:devhub_kenya/utils/constants/image_strings.dart';
import 'package:devhub_kenya/utils/constants/text_strings.dart';
import 'package:devhub_kenya/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// Send Email whenever Verify  screen appears and set timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// Send Email Verification Link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      DLoaders.successSnackBar(
          title: 'Email Sent!',
          message: 'Please check your inbox and verify your email.');
    } catch (e) {
      DLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
              image: DImages.successAnimation,
              title: DTexts.yourAccountCreatedTitle,
              subTitle: DTexts.yourAccountCreatedSubTitle,
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirect(),
            ),
        );
      }
    });
  }

  /// check manually
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
        image: DImages.successAnimation,
        title: DTexts.yourAccountCreatedTitle,
        subTitle: DTexts.yourAccountCreatedSubTitle,
        onPressed: () =>
            AuthenticationRepository.instance.screenRedirect(),
      ),
      );
    }
  }
}
