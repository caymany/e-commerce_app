import 'package:devhub_kenya/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:devhub_kenya/common/widgets/icons/d_circular_icon.dart';
import 'package:devhub_kenya/common/widgets/images/d_rounded_images.dart';
import 'package:devhub_kenya/common/widgets/products/favorite_icon/favorite_icon.dart';
import 'package:devhub_kenya/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:devhub_kenya/common/widgets/texts/product_price_text.dart';
import 'package:devhub_kenya/common/widgets/texts/product_title_text.dart';
import 'package:devhub_kenya/features/shop/controllers/product/product_controller.dart';
import 'package:devhub_kenya/features/shop/models/product_model.dart';
import 'package:devhub_kenya/features/shop/screens/cart/widgets/add_to_cart_button.dart';
import 'package:devhub_kenya/features/shop/screens/product_details/product_detail.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/constants/enums.dart';
import 'package:devhub_kenya/utils/constants/image_strings.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:devhub_kenya/common/styles/shadows.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class DProductCardVertical extends StatelessWidget {
  const DProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = DHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetail(product: product)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [DShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(DSizes.productImageRadius),
          color: dark ? DColors.darkerGrey : DColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Thumbnail, Wishlist, Discount Tag
            DRoundedContainer(
              height: 180,
              width: 180,
              padding: const EdgeInsets.all(DSizes.sm),
              backgroundColor: dark ? DColors.dark : DColors.light,
              child: Stack(
                children: [
                  /// Thumbnail Image
                  Center(
                    child: DRoundedImage(
                        imageUrl: product.thumbnail, applyImageRadius: true, isNetworkImage: true),
                  ),

                  ///Sale Tag
                  if (salePercentage != null)
                  Positioned(
                    top: 12,
                    child: DRoundedContainer(
                      radius: DSizes.sm,
                      backgroundColor: DColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: DSizes.sm, vertical: DSizes.xs),
                      child: Text('$salePercentage%',
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
                    child:DFavouriteIcon(productId: product.id),
                  ),
                ],
              ),
            ),
            const SizedBox(height: DSizes.spaceBtwItems / 2),

            /// Details
            Padding(
              padding: EdgeInsets.only(left: DSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DProductTitleText(title: product.title, smallSize: true),
                  const SizedBox(height: DSizes.spaceBtwItems / 2),
                  DBrandTitleWithVerifiedIcon(title: product.brand!.name),
                  //Spacer
                ],
              ),
            ),
            const Spacer(),

            ///Price
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
                ProductCartAddToCartButton(product: product),

              ],
            )
          ],
        ),
      ),
    );
  }
}
