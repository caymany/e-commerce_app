import 'package:devhub_kenya/common/widgets/icons/d_circular_icon.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DProductQuantityWithAddRemove extends StatelessWidget {
  const DProductQuantityWithAddRemove({
    super.key,
  });

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
        ),
        const SizedBox(width: DSizes.spaceBtwItems),
        Text('2',
            style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: DSizes.spaceBtwItems),
        const DCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: DSizes.md,
          color: DColors.white,
          backgroundColor: DColors.primary,
        ),
      ],
    );
  }
}