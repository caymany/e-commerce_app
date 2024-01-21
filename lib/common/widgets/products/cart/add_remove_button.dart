import 'package:devhub_kenya/common/widgets/icons/d_circular_icon.dart';
import 'package:devhub_kenya/features/shop/controllers/product/cart_controller.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DProductQuantityWithAddRemove extends StatelessWidget {
  const DProductQuantityWithAddRemove({
    super.key, required this.quantity, this.add, this.remove,
  });

  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        DCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: DSizes.md,
          color: DHelperFunctions.isDarkMode(context)
              ? DColors.white
              : DColors.dark,
          backgroundColor: DHelperFunctions.isDarkMode(context)
              ? DColors.darkerGrey
              : DColors.light,
          onPressed: remove,
        ),
        const SizedBox(width: DSizes.spaceBtwItems),
        Text(quantity.toString(),
            style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: DSizes.spaceBtwItems),
        DCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: DSizes.md,
          color: DColors.white,
          backgroundColor: DColors.primary,
          onPressed: add,
        ),
      ],
    );
  }
}