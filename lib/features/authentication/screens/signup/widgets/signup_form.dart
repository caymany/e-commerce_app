import 'package:devhub_kenya/features/authentication/controllers/signup/signup_controller.dart';
import 'package:devhub_kenya/features/authentication/screens/signup/widgets/tearmsAndconditions.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/constants/text_strings.dart';
import 'package:devhub_kenya/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:devhub_kenya/features/authentication/screens/signup/verify_email.dart';

class DSignupForm extends StatelessWidget {
  const DSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              /// First Name
              Expanded(
                child: TextFormField(
                  controller: controller.firstname,
                  validator: (value) =>
                      DValidator.validateEmptyText('Firstname', value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: DTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: DSizes.spaceBtwInputFields),

              /// Last Name
              Expanded(
                child: TextFormField(
                  controller: controller.lastname,
                  validator: (value) =>
                      DValidator.validateEmptyText('Lastname', value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: DTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: DSizes.spaceBtwInputFields),

          /// Username
          TextFormField(
            controller: controller.username,
            validator: (value) =>
                DValidator.validateEmptyText('Username', value),
            expands: false,
            decoration: const InputDecoration(
              labelText: DTexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(height: DSizes.spaceBtwInputFields),

          /// Email
          TextFormField(
            controller: controller.email,
            validator: (value) => DValidator.validateEmail(value),
            expands: false,
            decoration: const InputDecoration(
              labelText: DTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(height: DSizes.spaceBtwInputFields),

          /// Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) =>
                DValidator.validateEmptyText('Phone No', value),
            expands: false,
            decoration: const InputDecoration(
              labelText: DTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: DSizes.spaceBtwInputFields),

          /// Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => DValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              expands: false,
              decoration: InputDecoration(
                labelText: DTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value =
                      !controller.hidePassword.value,
                  icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                ),
              ),
            ),
          ),
          const SizedBox(height: DSizes.spaceBtwInputFields),

          /// Terms and Conditions
          const DTearmsandConditionsCheckbox(),
          const SizedBox(height: DSizes.spaceBtwItems),

          /// Sign Up Button
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.signup(),
                  child: const Text(DTexts.createAccount)))

          /// Social Icons
        ],
      ),
    );
  }
}
