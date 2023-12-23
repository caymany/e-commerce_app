import 'package:devhub_kenya/data/repositories/authentication/authentication_repository.dart';
import 'package:devhub_kenya/data/repositories/user/user_repository.dart';
import 'package:devhub_kenya/data/services/network_manager.dart';
import 'package:devhub_kenya/features/authentication/screens/signup/verify_email.dart';
import 'package:devhub_kenya/features/personalization/models/user_model.dart';
import 'package:devhub_kenya/utils/constants/image_strings.dart';
import 'package:devhub_kenya/utils/popups/full_screen_loader.dart';
import 'package:devhub_kenya/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs; //Observable for hiding and showing the password
  final privacyPolicy = true.obs; //Observable for hiding and showing the password
  final email = TextEditingController(); // Controller for email
  final lastname = TextEditingController(); // Controller for lastname
  final username = TextEditingController(); // Controller for username
  final password = TextEditingController(); // Controller for password
  final firstname = TextEditingController(); // Controller for firstname
  final phoneNumber = TextEditingController(); // Controller for phoneNumber
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); // Form key for form validation
  /// Signup
  void signup() async {
    try {
      // Start Loading
      DFullscreenLoader.openLoadingDialog('We are processing your information...', DImages.processingAnim);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;
      // Form Validation
      if (!signupFormKey.currentState!.validate()) return;

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        DLoaders.warningSnackBar(title: 'Accept Privacy Policy', message: 'Please read anc accept the privacy policy before proceeding.',
        );
        return;
      }
      // Register user inside firebase Auth and save data in firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      // save authenticated user data in firebase FireStore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName : firstname.text.trim(),
        lastName: lastname.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);
      // Show success message
      DLoaders.successSnackBar(title: 'Congratulations', message: 'Your account has been created! Verify Email to continue');

      // Move to verify email screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));

    } catch (e) {
      // Show some errors
      DLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove Loader
      DFullscreenLoader.stopLoading();
    }
  }
}
