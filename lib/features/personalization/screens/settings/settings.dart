import 'package:devhub_kenya/common/widgets/appbar/appbar.dart';
import 'package:devhub_kenya/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:devhub_kenya/common/widgets/images/d_circular_images.dart';
import 'package:devhub_kenya/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:devhub_kenya/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:devhub_kenya/common/widgets/texts/section_heading.dart';
import 'package:devhub_kenya/data/repositories/authentication/authentication_repository.dart';
import 'package:devhub_kenya/features/personalization/screens/address/address.dart';
import 'package:devhub_kenya/features/personalization/screens/profile/profile.dart';
import 'package:devhub_kenya/features/shop/screens/cart/cart.dart';
import 'package:devhub_kenya/features/shop/screens/orders/orders.dart';
import 'package:devhub_kenya/utils/constants/image_strings.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthenticationRepository());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            DPrimaryHeaderContainer(
              child: Column(
                children: [
                  DAppBar(
                      title: Text('Account',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .apply(color: Colors.white))),
                  const SizedBox(height: DSizes.spaceBtwSections),

                  /// User Profile Card
                  DUserProfileTile(
                      onPressed: () => Get.to(() => const ProfileScreen())),
                  const SizedBox(height: DSizes.spaceBtwSections),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(DSizes.defaultSpace),
              child: Column(
                children: [
                  /// Account Settings
                  const DSectionHeading(
                      title: 'Account Settings', showActionButton: false),
                  const SizedBox(height: DSizes.spaceBtwItems),

                  DSettingsMenuTile(
                      icon: Iconsax.safe_home,
                      title: 'My Address',
                      subTitle: 'Set shopping delivery address',
                      onTap: () => Get.to(() => const UserAddressScreen())),
                  DSettingsMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: 'My Cart',
                      subTitle: 'Add or remove products and move to checkout',
                      onTap: () => Get.to(() => const CartScreen())),
                  DSettingsMenuTile(
                      icon: Iconsax.bag_tick,
                      title: 'My Orders',
                      subTitle: 'In-progress and Complete Orders',
                      onTap: () => Get.to(() => const OrderScreen())),
                  const DSettingsMenuTile(
                      icon: Iconsax.bank,
                      title: 'Payment Account',
                      subTitle: 'Add or Configure preferred payment methods'),
                  const DSettingsMenuTile(
                      icon: Iconsax.discount_shape,
                      title: 'My Coupons',
                      subTitle: 'List of All Discounted Coupons'),
                  const DSettingsMenuTile(
                      icon: Iconsax.notification,
                      title: 'Notifications',
                      subTitle: 'Notification settings and Preferences'),
                  const DSettingsMenuTile(
                      icon: Iconsax.security_card,
                      title: 'Account Privacy',
                      subTitle: 'Manage data usage and connected accounts'),

                  /// App Settings
                  const SizedBox(height: DSizes.spaceBtwSections),
                  const DSectionHeading(
                      title: 'App Settings', showActionButton: false),
                  const SizedBox(height: DSizes.spaceBtwItems),
                  const DSettingsMenuTile(
                      icon: Iconsax.document_upload,
                      title: 'Load Data',
                      subTitle: 'Upload data to cloud database'),
                  DSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geo Location',
                    subTitle: 'Set recommendation based on location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  DSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subTitle: 'Search results in safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  DSettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subTitle: 'Display images in full resolution',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  const SizedBox(height: DSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(onPressed: () => controller.logout(), child: const Text('Logout')),
                  ),
                  const SizedBox(height: DSizes.spaceBtwSections *2.5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
