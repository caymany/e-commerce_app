import 'package:devhub_kenya/common/widgets/icons/d_circular_icon.dart';
import 'package:devhub_kenya/features/shop/controllers/product/cart_controller.dart';
import 'package:devhub_kenya/features/shop/models/product_model.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';

class DBottomAddToCart extends StatelessWidget {
  const DBottomAddToCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    final dark = DHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: DSizes.defaultSpace, vertical: DSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? DColors.darkerGrey : DColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(DSizes.cardRadiusLg),
          topRight: Radius.circular(DSizes.cardRadiusLg),
        ),
      ),
      child: Obx(
      () => Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
              children: [
                DCircularIcon(
                  icon: Iconsax.minus,
                  backgroundColor: DColors.grey,
                  width: 40,
                  height: 40,
                  color: DColors.white,
                  onPressed: () => controller.productQuantityInCart.value <1 ? null : controller.productQuantityInCart.value -=1,
                ),
                const SizedBox(width: DSizes.spaceBtwItems),
                Text(controller.productQuantityInCart.value.toString(), style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(width: DSizes.spaceBtwItems),
                DCircularIcon(
                  icon: Iconsax.add,
                  backgroundColor: DColors.black,
                  width: 40,
                  height: 40,
                  color: DColors.white,
                  onPressed: () => controller.productQuantityInCart.value +=1,
                ),
              ],
            ),
          ElevatedButton(
            onPressed: () => controller.productQuantityInCart.value <1 ? null : () => controller.addToCart(product),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(DSizes.md),
              backgroundColor: DColors.black,
            ),
            child: const Text('Add to Cart'),
          ),
        ],
      ),
      ),
    );
  }
}
