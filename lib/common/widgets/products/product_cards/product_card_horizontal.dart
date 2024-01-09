import 'package:devhub_kenya/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:devhub_kenya/common/widgets/icons/d_circular_icon.dart';
import 'package:devhub_kenya/common/widgets/images/d_rounded_images.dart';
import 'package:devhub_kenya/common/widgets/products/favorite_icon/favorite_icon.dart';
import 'package:devhub_kenya/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:devhub_kenya/common/widgets/texts/product_price_text.dart';
import 'package:devhub_kenya/common/widgets/texts/product_title_text.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/constants/image_strings.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DProductCardHorizontal extends StatelessWidget {
  const DProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = DHelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DSizes.productImageRadius),
        color: dark ? DColors.darkerGrey : DColors.softGrey,
      ),
      child: Row(
        children: [
          ///Thumbnail
          DRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(DSizes.sm),
            backgroundColor: dark ? DColors.dark : DColors.light,
            child: Stack(
              children: [
                const SizedBox(
                  width: 120,
                  height: 120,
                  child: DRoundedImage(
                      imageUrl: DImages.canonG3420, applyImageRadius: true),
                ),

                /// Sale Tag
                Positioned(
                  top: 12,
                  child: DRoundedContainer(
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
                ),

                /// Favorite Icon
               const  Positioned(
                  top: 0,
                  right: 0,
                  child: DFavouriteICon(),
                ),
              ],
            ),
          ),
          
          /// Details
         SizedBox(
           width: 172,
           child: Padding(
             padding: const EdgeInsets.only(top: DSizes.sm, left: DSizes.sm),
             child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DProductTitleText(title: 'Canon Printer', smallSize: true),
                      SizedBox(height: DSizes.spaceBtwItems / 2),
                      DBrandTitleWithVerifiedIcon(title: 'canon')
                    ],
                  ),

                 const Spacer(),

                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(child: DProductPriceText(price: '6,500')),

                      ///Add to cart
                      Container(
                        decoration: const BoxDecoration(
                            color: DColors.dark,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(DSizes.cardRadiusMd),
                              bottomRight:
                              Radius.circular(DSizes.productImageRadius),
                            )),
                        child: const SizedBox(
                            width: DSizes.iconLg * 1.2,
                            height: DSizes.iconLg * 1.2,
                            child: Center(child: Icon(Iconsax.add, color: DColors.white))),
                      )
                    ],
                  )
                ],
              ),
           ),
         )
        ],
      ),
    );
  }
}
