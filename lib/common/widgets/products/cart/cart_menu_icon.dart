import 'package:devhub_kenya/features/shop/controllers/product/cart_controller.dart';
import 'package:devhub_kenya/features/shop/screens/cart/cart.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class DCartCountericon extends StatelessWidget {
  const DCartCountericon({
    super.key,
    this.iconColor,
    this.counterBgColor,
    this.counterTextColor,
  });

  final Color? iconColor, counterBgColor, counterTextColor;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    final dark = DHelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
            onPressed: () => Get.to(() => const CartScreen()),
            icon: const Icon(Iconsax.shopping_bag, color: DColors.dark)),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: DColors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Obx(
                () => Text(controller.noOfCartItems.value.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(color: counterBgColor ?? (dark ? DColors.black : DColors.white), fontSizeFactor: 0.8)),
              ),
            ),
          ),
        )
      ],
    );
  }
}
