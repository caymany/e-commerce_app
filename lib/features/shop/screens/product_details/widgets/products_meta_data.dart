import 'package:devhub_kenya/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:devhub_kenya/common/widgets/images/d_circular_images.dart';
import 'package:devhub_kenya/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:devhub_kenya/common/widgets/texts/product_price_text.dart';
import 'package:devhub_kenya/common/widgets/texts/product_title_text.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/constants/enums.dart';
import 'package:devhub_kenya/utils/constants/image_strings.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class DProductMetaData extends StatelessWidget {
  const DProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = DHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///Price & Sale Price
        Row(
          children: [
            ///Sale Tag
            DRoundedContainer(
              radius: DSizes.sm,
              backgroundColor: DColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: DSizes.sm, vertical: DSizes.xs),
              child: Text('25%',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: DColors.black)),
            ),
            const SizedBox(width: DSizes.spaceBtwItems),

            /// Price
            Text('Ksh 16,000',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: DSizes.spaceBtwItems),
            const DProductPriceText(price: '12,000', isLarge: true),
          ],
        ),
        const SizedBox(height: DSizes.spaceBtwItems / 1.5),

        /// Title
        const DProductTitleText(title: 'Canon Prixma Printer'),
        const SizedBox(height: DSizes.spaceBtwItems / 1.5),

        /// Stock Status
        Row(
          children: [
            const DProductTitleText(title: 'Status'),
            const SizedBox(width: DSizes.spaceBtwItems / 1.5),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),

        const SizedBox(height: DSizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            DCircularImage(
              image: DImages.hpLogo,
              width: 32,
              height: 32,
              overlayColor: darkMode? Colors.white: DColors.dark,
            ),
            const DBrandTitleWithVerifiedIcon(
                title: 'Canon', brandTextSizes: TextSizes.medium),
          ],
        ),
      ],
    );
  }
}
