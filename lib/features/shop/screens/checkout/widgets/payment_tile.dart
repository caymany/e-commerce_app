import 'package:devhub_kenya/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:devhub_kenya/features/shop/controllers/product/checkout_controller.dart';
import 'package:devhub_kenya/features/shop/models/payment_method_model.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class DPaymentTile extends StatelessWidget {
  const DPaymentTile({super.key, required this.paymentMethod, });

  final PaymentMethodModel paymentMethod;

  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () {
        // controller.selectedPaymentMethod.value = paymentMethod;
        Get.back();
      },
      leading: DRoundedContainer(
        width: 60,
        height: 60,
          backgroundColor: DHelperFunctions.isDarkMode(context) ? DColors.light : Colors.white,
        padding: const EdgeInsets.all(DSizes.sm),
        child: Image(image: AssetImage(paymentMethod.image), fit: BoxFit.contain),
      ),
      title: Text(paymentMethod.name),
      trailing: const Icon(Iconsax.arrow_right_34),
    );
  }
}
