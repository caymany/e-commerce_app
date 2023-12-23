import 'package:devhub_kenya/common/widgets/appbar/appbar.dart';
import 'package:devhub_kenya/features/personalization/controllers/update_name_controller.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/constants/text_strings.dart';
import 'package:devhub_kenya/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      // App Bar
      appBar: DAppBar(
        showBackArrow: true,
        title: Text('Change Name', style: Theme
            .of(context)
            .textTheme
            .headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(DSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Headings
            Text('Use your real name for easy verification.', style: Theme
                .of(context)
                .textTheme
                .labelMedium),
            const SizedBox(height: DSizes.spaceBtwSections),

            /// Text Field and Buttons
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.fistName,
                    validator: (value) =>
                        DValidator.validateEmptyText('First name', value),
                    expands: false,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.user),
                        labelText: DTexts.firstName),

                  ),
                  const SizedBox(height: DSizes.spaceBtwInputFields),
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) =>
                        DValidator.validateEmptyText('Last name', value),
                    expands: false,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.user),
                        labelText: DTexts.lastName),

                  ),
                ],

              ),),
            const SizedBox(height: DSizes.spaceBtwSections),

            /// Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.updateUserName(),
                  child: const Text('Save')),
            )
          ],
        ),
      ),
    );
  }
}