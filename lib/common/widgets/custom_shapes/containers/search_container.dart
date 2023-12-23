import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/device/device_utility.dart';
import 'package:devhub_kenya/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DSearchContainer extends StatelessWidget {
  const DSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: DSizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = DHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: DDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(DSizes.md),
          decoration: BoxDecoration(
            color: showBackground
                ? dark
                    ? DColors.dark
                    : DColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(DSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: DColors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(icon, color: DColors.darkerGrey),
              const SizedBox(width: DSizes.spaceBtwItems),
              Text('Search in Store',
                  style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
