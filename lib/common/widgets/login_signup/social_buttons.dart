import 'package:devhub_kenya/data/repositories/authentication/authentication_repository.dart';
import 'package:devhub_kenya/features/authentication/controllers/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/constants/image_strings.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DSocialButtons extends StatelessWidget {
  const DSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: DColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: const Image(
                width: DSizes.iconMd,
                height: DSizes.iconMd,
                image: AssetImage(DImages.google)),
          ),
        ),
        const SizedBox(width: DSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: DColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
                width: DSizes.iconMd,
                height: DSizes.iconMd,
                image: AssetImage(DImages.facebook)),
          ),
        ),
      ],
    );
  }
}