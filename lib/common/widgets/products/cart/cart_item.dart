import 'package:devhub_kenya/common/widgets/images/d_rounded_images.dart';
import 'package:devhub_kenya/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:devhub_kenya/common/widgets/texts/product_title_text.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/constants/image_strings.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class DCartItem extends StatelessWidget {
  const DCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Image
        DRoundedImage(
          imageUrl: DImages.canonG3420,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(DSizes.sm),
          backgroundColor: DHelperFunctions.isDarkMode(context)
              ? DColors.darkerGrey
              : DColors.light,
        ),
        const SizedBox(width: DSizes.spaceBtwItems),

        /// Title
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DBrandTitleWithVerifiedIcon(title: 'Canon'),
              const Flexible(
                child: DProductTitleText(
                    title: 'Canon Prixma Printer', maxLines: 1),
              ),

              /// Attributes
              Text.rich(TextSpan(
                  children: [
                    TextSpan(text: ' Color ', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: ' Green ', style: Theme.of(context).textTheme.bodyLarge),

                    TextSpan(text: ' Size ', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: ' A4 & A5 ', style: Theme.of(context).textTheme.bodyLarge),
                  ]
              ))
            ],
          ),
        )
      ],
    );
  }
}