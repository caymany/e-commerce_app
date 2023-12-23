import 'package:devhub_kenya/features/authentication/controllers/signup/signup_controller.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/constants/text_strings.dart';
import 'package:devhub_kenya/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DTearmsandConditionsCheckbox extends StatelessWidget {
  const DTearmsandConditionsCheckbox({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = DHelperFunctions.isDarkMode(context);
    final controller = SignupController.instance;
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Obx(
                    () =>
                    Checkbox(
                        value: controller.privacyPolicy.value,
                        onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value),
                        )),
        const SizedBox(width: DSizes.spaceBtwItems),
        Text.rich(
          TextSpan(children: [
            TextSpan(
                text: '${DTexts.iAgreeTo} ',
                style: Theme
                    .of(context)
                    .textTheme
                    .bodySmall),
            TextSpan(
              text: DTexts.privacyPolicy,
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(
                color: dark ? DColors.white : DColors.primary,
                decoration: TextDecoration.underline,
                decorationColor:
                dark ? DColors.white : DColors.primary,
              ),
            ),

            TextSpan(
              text: '${DTexts.and} ',
              style: Theme
                  .of(context)
                  .textTheme
                  .bodySmall,
            ),

            TextSpan(
              text: DTexts.termsofuse,
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(
                color: dark ? DColors.white : DColors.primary,
                decoration: TextDecoration.underline,
                decorationColor:
                dark ? DColors.white : DColors.primary,
              ),
            ),
          ]),
        ),
      ],
    );
  }
}