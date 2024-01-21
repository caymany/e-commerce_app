import 'package:devhub_kenya/common/widgets/images/d_rounded_images.dart';
import 'package:devhub_kenya/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:devhub_kenya/common/widgets/texts/product_title_text.dart';
import 'package:devhub_kenya/features/shop/models/cart_item_model.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/constants/image_strings.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class DCartItem extends StatelessWidget {
  const DCartItem({
    super.key,
    required this.cartItem,
  });

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Image
        DRoundedImage(
          imageUrl: cartItem.image ?? '',
          width: 60,
          height: 60,
          isNetworkImage : true,
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
              DBrandTitleWithVerifiedIcon(title: cartItem.brandName ?? ''),
              Flexible(
                child: DProductTitleText(title: cartItem.title, maxLines: 1),
              ),

              /// Attributes
              Text.rich(
                TextSpan(
                  children: (cartItem.selectedVariation ?? {})
                      .entries
                      .map(
                        (e) => TextSpan(
                          children: [
                            TextSpan(
                                text: ' ${e.key}',
                                style: Theme.of(context).textTheme.bodySmall),
                            TextSpan(
                                text: ' ${e.key}',
                                style: Theme.of(context).textTheme.bodyLarge),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
