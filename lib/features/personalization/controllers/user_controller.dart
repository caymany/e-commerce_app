import 'package:devhub_kenya/data/repositories/authentication/authentication_repository.dart';
import 'package:devhub_kenya/data/repositories/user/user_repository.dart';
import 'package:devhub_kenya/data/services/network_manager.dart';
import 'package:devhub_kenya/features/authentication/screens/login/login.dart';
import 'package:devhub_kenya/features/personalization/models/user_model.dart';
import 'package:devhub_kenya/features/personalization/screens/profile/re_auth_user_login_form.dart';
import 'package:devhub_kenya/utils/constants/image_strings.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/popups/full_screen_loader.dart';
import 'package:devhub_kenya/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel
      .empty()
      .obs;
  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();


  @override
  void onInit() {
    super.onInit();

    fetchUserRecord();
  }

  /// fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    }
    finally {
      profileLoading.value = false;
    }
  }

  /// Save user record
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      //Refresh User record
      await fetchUserRecord();

      // If no record already stored
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          if (userCredential != null) {
            // Convert name to First and Last Name
            final nameParts =
            UserModel.nameParts(userCredential.user!.displayName ?? '');
            final username =
            UserModel.generateUsername(userCredential.user!.displayName ?? '');

            // Map Data
            final user = UserModel(
              id: userCredential.user!.uid,
              firstName: nameParts[0],
              lastName: nameParts.length > 1
                  ? nameParts.sublist(1).join(' ')
                  : '',
              username: username,
              email: userCredential.user!.email ?? '',
              phoneNumber: userCredential.user!.phoneNumber ?? '',
              profilePicture: userCredential.user!.photoURL ?? '',
            );

            // Save user Data
            await userRepository.saveUserRecord(user);
          }
        }
      }
    } catch (e) {
      DLoaders.warningSnackBar(
          title: 'Data not Saved',
          message: 'Something went wrong. Please try again');
    }
  }

  /// Delete account warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(DSizes.md),
      title: 'Delete Account',
      middleText: 'Are you sure you want to delete your account permanently? This action is not reversible and all your data will be deleted permanently.',
      confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red,
              side: const BorderSide(color: Colors.red)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: DSizes.lg),
            child: Text('Delete'),)
      ),
      cancel: OutlinedButton(
          onPressed: () => Navigator.of(Get.overlayContext!).pop(),
          child: const Text('Cancel')),
    );
  }

  /// Delete User Account
  void deleteUserAccount() async {
    try {
      DFullscreenLoader.openLoadingDialog('Processing', DImages.newDocerAnim);

      // First reAuth user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!
          .providerData
          .map((e) => e.providerId)
          .first;
      if (provider.isNotEmpty) {
        // Re Verify Email Auth
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          DFullscreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          DFullscreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      DFullscreenLoader.stopLoading();
      DLoaders.warningSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  /// Re auth User before Deleting account
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      DFullscreenLoader.openLoadingDialog('Processing', DImages.newDocerAnim);

      // Check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        DFullscreenLoader.stopLoading();
        return;
      }
      if (!reAuthFormKey.currentState!.validate()) {
        DFullscreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
          verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      DFullscreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      DFullscreenLoader.stopLoading();
      DLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Upload profile image
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        imageUploading.value = true;
        final imageUrl = await userRepository.uploadImage(
            'Users/Images/Profile', image);

        // Update
        Map <String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();
        DLoaders.successSnackBar(title: 'Congratulations',
            message: 'Your profile image has been updated');
      }
    } catch (e) {
      DLoaders.errorSnackBar(
          title: 'Oh Snap', message: 'Something went wrong: $e');
    } finally {
      imageUploading.value = false;
    }
  }
}
