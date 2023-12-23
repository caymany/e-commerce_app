import 'package:devhub_kenya/data/repositories/authentication/authentication_repository.dart';
import 'package:devhub_kenya/data/services/network_manager.dart';
import 'package:devhub_kenya/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:devhub_kenya/utils/constants/image_strings.dart';
import 'package:devhub_kenya/utils/popups/full_screen_loader.dart';
import 'package:devhub_kenya/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

  /// Send Reset Password Email
  sendPasswordResetEmail() async {
    try {
      DFullscreenLoader.openLoadingDialog(
          'Processing your request..', DImages.newDocerAnim);

      // Check Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        DFullscreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!forgotPasswordFormKey.currentState!.validate()) {
        DFullscreenLoader.stopLoading();
        return;
      }

      //Send Email to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      //Remove loader
      DFullscreenLoader.stopLoading();

      // Show success Screen
      DLoaders.successSnackBar(title: 'Email Sent', message: 'Check inbox and follow the link to reset your password.');

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      // Remove Loader
      DFullscreenLoader.stopLoading();
      DLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
  resendPasswordResetEmail(String email) async {
    try {
      DFullscreenLoader.openLoadingDialog(
          'Processing your request..', DImages.newDocerAnim);

      // Check Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        DFullscreenLoader.stopLoading();
        return;
      }

      //Send Email to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      //Remove loader
      DFullscreenLoader.stopLoading();

      // Show success Screen
      DLoaders.successSnackBar(title: 'Email Resent', message: 'Check inbox and follow the link to reset your password.');
    } catch (e) {
      // Remove Loader
      DFullscreenLoader.stopLoading();
      DLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

}
