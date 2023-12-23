import 'package:devhub_kenya/common/widgets/appbar/appbar.dart';
import 'package:devhub_kenya/common/widgets/images/d_circular_images.dart';
import 'package:devhub_kenya/common/widgets/texts/section_heading.dart';
import 'package:devhub_kenya/features/personalization/controllers/user_controller.dart';
import 'package:devhub_kenya/features/personalization/screens/profile/change_name.dart';
import 'package:devhub_kenya/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:devhub_kenya/utils/constants/image_strings.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/popups/shimmer_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const DAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(DSizes.defaultSpace),
          child: Column(
            children: [
              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty ? networkImage : DImages.userIcon;
                      return controller.imageUploading.value
                          ? const DShimmerEffect(width: 80, height: 80, radius: 80)
                          : DCircularImage(image: image, width: 80, height: 80, isNetworkImage : networkImage.isNotEmpty);
                    }),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: const Text('Change Profile Picture', style: TextStyle(fontSize: 18))),
                  ],
                ),
              ),
              const SizedBox(height: DSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: DSizes.spaceBtwItems),

              const DSectionHeading(title: 'Profile Information', showActionButton: false),
              const SizedBox(height: DSizes.spaceBtwItems),

              DProfileMenu(title: 'Name',value: controller.user.value.fullName,onPressed: () => Get.to(() => const ChangeName())),
              DProfileMenu(title: 'Username',value: controller.user.value.username,onPressed: (){}),

              const SizedBox(height: DSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: DSizes.spaceBtwItems),

              const DSectionHeading(title: 'Personal Information', showActionButton: false),
              const SizedBox(height: DSizes.spaceBtwItems),
              DProfileMenu(title: 'User Id',value: controller.user.value.id,icon: Iconsax.copy, onPressed: (){}),
              DProfileMenu(title: 'Email',value: controller.user.value.email,onPressed: (){}),
              DProfileMenu(title: 'Phone No',value: controller.user.value.phoneNumber,onPressed: (){}),
              DProfileMenu(title: 'Gender',value: 'Male',onPressed: (){}),

              const Divider(),
              const SizedBox(height: DSizes.spaceBtwSections),
              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text('Delete Account', style: TextStyle(color: Colors.red,fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


