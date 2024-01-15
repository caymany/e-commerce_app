import 'dart:html';

import 'package:devhub_kenya/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:devhub_kenya/common/widgets/icons/d_circular_icon.dart';
import 'package:devhub_kenya/common/widgets/images/d_rounded_images.dart';
import 'package:devhub_kenya/common/widgets/products/favorite_icon/favorite_icon.dart';
import 'package:devhub_kenya/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:devhub_kenya/common/widgets/texts/product_price_text.dart';
import 'package:devhub_kenya/common/widgets/texts/product_title_text.dart';
import 'package:devhub_kenya/features/shop/controllers/product/product_controller.dart';
import 'package:devhub_kenya/features/shop/models/product_model.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/constants/enums.dart';
import 'package:devhub_kenya/utils/constants/image_strings.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DProductCardHorizontal extends StatelessWidget {
  const DProductCardHorizontal({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
    controller.calculateSalePercentage(product.price, product.salePrice);
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
                SizedBox(
                  width: 120,
                  height: 120,
                  child: DRoundedImage(
                      imageUrl: product.thumbnail, applyImageRadius: true, isNetworkImage: true),
                ),

                /// Sale Tag
                if (salePercentage != null)
                Positioned(
                  top: 12,
                  child: DRoundedContainer(
                    radius: DSizes.sm,
                    backgroundColor: DColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: DSizes.sm, vertical: DSizes.xs),
                    child: Text('$salePercentage',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: DColors.black)),
                  ),
                ),

                /// Favorite Icon
                Positioned(
                  top: 0,
                  right: 0,
                  child: DFavouriteIcon(productId: product.id),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DProductTitleText(title: product.title, smallSize: true),
                      const SizedBox(height: DSizes.spaceBtwItems / 2),
                      DBrandTitleWithVerifiedIcon(title: product.brand!.name)
                    ],
                  ),

                 const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          children: [
                            if (product.productType ==
                                ProductType.single.toString() &&
                                product.salePrice > 0)
                              Padding(
                                padding: EdgeInsets.only(left: DSizes.sm),
                                child: Text(
                                  product.price.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .apply(decoration: TextDecoration.lineThrough),
                                ),
                              ),

                            ///Show sale price as main price is sale exist
                            Padding(
                              padding: EdgeInsets.only(left: DSizes.sm),
                              child: DProductPriceText(
                                  price: controller.getProductPrice(product)),
                            ),
                          ],
                        ),
                      ),

                      ///Add to cart
                      Container(
                        decoration: const BoxDecoration(
                            color: DColors.dark,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(DSizes.cardRadiusMd),
                              bottomRight: Radius.circular(DSizes.productImageRadius),
                            )),
                        child: const SizedBox(
                            width: DSizes.iconLg * 1.2,
                            height: DSizes.iconLg * 1.2,
                            child: Center(
                                child: Icon(Iconsax.add, color: DColors.white))),
                      ),
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
