import 'package:devhub_kenya/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:devhub_kenya/common/widgets/texts/section_heading.dart';
import 'package:devhub_kenya/features/shop/controllers/product/checkout_controller.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/constants/image_strings.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DBillingPaymentSection extends StatelessWidget {
  const DBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());
    final dark = DHelperFunctions.isDarkMode(context);
    return Obx(() => Column(
        children: [
          DSectionHeading(title: 'Payment Method', buttonTitle: 'Change',onPressed: () => controller.selectPaymentMethod(context)),
          const SizedBox(height: DSizes.defaultSpace / 2),
          Row(
              children: [
                DRoundedContainer(
                  width: 60,
                  height: 60,
                  backgroundColor: dark ? DColors.light : DColors.white,
                  padding: const EdgeInsets.all(DSizes.sm),
                  child: Image(image: AssetImage(controller.selectedPaymentMethod.value.image), fit: BoxFit.cover),
                ),
                const SizedBox(width: DSizes.spaceBtwItems/2),
                Text(controller.selectedPaymentMethod.value.name, style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
        ],
      ),
    );
  }
}
