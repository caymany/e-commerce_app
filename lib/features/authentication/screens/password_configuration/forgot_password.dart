import 'package:devhub_kenya/features/authentication/controllers/forgot_password/forgot_passsword_controller.dart';
import 'package:devhub_kenya/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/constants/text_strings.dart';
import 'package:devhub_kenya/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(DSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Headings
            Text(DTexts.forgetPasswordTitle,style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: DSizes.spaceBtwItems),
            Text(DTexts.forgetPasswordSubTitle,style: Theme.of(context).textTheme.labelSmall),
            const SizedBox(height: DSizes.spaceBtwSections * 2),
            ///Text Field
            Form(
              key: controller.forgotPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: DValidator.validateEmail,
                decoration: const InputDecoration(labelText: DTexts.email, prefixIcon: Icon(Iconsax.direct_right)),
              ),
            ),
            const SizedBox(height: DSizes.spaceBtwSections),

            ///Submit Button
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => controller.sendPasswordResetEmail(), child: const Text(DTexts.dsubmit))),

          ],
        ),

      ),
    );
  }
}
