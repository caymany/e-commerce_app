import 'package:devhub_kenya/data/repositories/authentication/authentication_repository.dart';
import 'package:devhub_kenya/data/services/network_manager.dart';
import 'package:devhub_kenya/features/personalization/controllers/user_controller.dart';
import 'package:devhub_kenya/utils/constants/image_strings.dart';
import 'package:devhub_kenya/utils/popups/full_screen_loader.dart';
import 'package:devhub_kenya/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  /// Variables
  final rememberMe = true.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL');
    password.text = localStorage.read('REMEMBER_ME_PASSWORD');
    super.onInit();
  }

  /// --- Email and Password Login
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      DFullscreenLoader.openLoadingDialog(
          'Logging you in..', DImages.newDocerAnim);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        DFullscreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        DFullscreenLoader.stopLoading();
        return;
      }

      // Save Data if remember me is Pressed
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login Using Email and Password Authentication
      final userCredentilas = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove Loader
      DFullscreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      DFullscreenLoader.stopLoading();
      DLoaders.errorSnackBar(title: 'Oh Snap ', message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
      // Start Loader
      DFullscreenLoader.openLoadingDialog(
          'Logging you in ..', DImages.newDocerAnim);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        DFullscreenLoader.stopLoading();
        return;
      }

      // Google Auth
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      // Save User Record
      await userController.saveUserRecord(userCredentials);

      // Remove Loader
      DFullscreenLoader.stopLoading();

      // Redirect User
      AuthenticationRepository.instance.screenRedirect();


    } catch (e) {
      DFullscreenLoader.stopLoading();
      DLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
