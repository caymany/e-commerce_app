import 'package:devhub_kenya/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DSingleAddress extends StatelessWidget {
  const DSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = DHelperFunctions.isDarkMode(context);
    return DRoundedContainer(
      padding: const EdgeInsets.all(DSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress
          ? DColors.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? DColors.darkerGrey
              : DColors.grey,
      margin: const EdgeInsets.only(bottom: DSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? dark
                      ? DColors.light
                      : DColors.dark
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Fabian Kimani',
              maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: DSizes.sm /2),
              const Text('(+252) 7465 46011', maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: DSizes.sm /2),
              const Text('20511, 00100, CityHall, Nairobi, Kenya',
                softWrap: true,
              ),

            ],
          )
        ],
      ),
    );
  }
}
