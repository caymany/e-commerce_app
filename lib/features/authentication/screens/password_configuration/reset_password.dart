import 'package:devhub_kenya/features/authentication/controllers/forgot_password/forgot_passsword_controller.dart';
import 'package:devhub_kenya/features/authentication/controllers/login/login_controller.dart';
import 'package:devhub_kenya/features/authentication/screens/login/login.dart';
import 'package:devhub_kenya/utils/constants/image_strings.dart';
import 'package:devhub_kenya/utils/constants/text_strings.dart';
import 'package:devhub_kenya/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(DSizes.defaultSpace),
            child: Column(
              children: [
                /// Image
                Image(
                  image: const AssetImage(DImages.receiveMail),
                  width: DHelperFunctions.screenWidth() * 0.6,
                ),
                const SizedBox(height: DSizes.spaceBtwSections),

                ///Title and Subtitle
                Text(email,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center),
                const SizedBox(height: DSizes.spaceBtwItems),
                Text(DTexts.changeYourPasswordTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center),
                const SizedBox(height: DSizes.spaceBtwItems),
                Text(DTexts.changeYourPasswordSubTitle,
                    style: Theme.of(context).textTheme.labelMedium,
                    textAlign: TextAlign.center),
                const SizedBox(height: DSizes.spaceBtwSections),

                /// Button
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => Get.offAll(() => const LoginScreen()),
                        child: const Text(DTexts.dcontinue))),
                const SizedBox(height: DSizes.spaceBtwSections),

                SizedBox(
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () => ForgotPasswordController.instance.resendPasswordResetEmail(email),
                        child: const Text(DTexts.resendEmail))),


              ],
            )),
      ),
    );
  }
}
