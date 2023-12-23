import 'package:devhub_kenya/data/repositories/user/user_repository.dart';
import 'package:devhub_kenya/data/services/network_manager.dart';
import 'package:devhub_kenya/features/personalization/controllers/user_controller.dart';
import 'package:devhub_kenya/features/personalization/screens/profile/profile.dart';
import 'package:devhub_kenya/utils/constants/image_strings.dart';
import 'package:devhub_kenya/utils/popups/full_screen_loader.dart';
import 'package:devhub_kenya/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

/// Controller to manage user related functionalities
class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final fistName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  /// initialise user data when Home Screen appears
  @override
  void onInit() {
    initializeName();
    super.onInit();
  }

  /// Fetch User Data
  Future<void> initializeName() async {
    fistName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // Start Loading
      DFullscreenLoader.openLoadingDialog(
          'Updating information..', DImages.newDocerAnim);

      // Check Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        DFullscreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        DFullscreenLoader.stopLoading();
        return;
      }

      // Update User's FirstName and LastName
      Map<String, dynamic> name = {
        'FirstName': fistName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      // Update RX User Value
      userController.user.value.firstName = fistName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Remove loader
      DFullscreenLoader.stopLoading();

      //Show success message
      DLoaders.successSnackBar(
          title: 'Congratulations', message: 'Your Name has been updated.');

      // Move screen to previous screen
      Get.off(() => const ProfileScreen());
    }
    catch (e) {
      DFullscreenLoader.stopLoading();
      DLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
