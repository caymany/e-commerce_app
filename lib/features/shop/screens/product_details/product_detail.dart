import 'package:devhub_kenya/common/widgets/texts/section_heading.dart';
import 'package:devhub_kenya/features/shop/models/product_model.dart';
import 'package:devhub_kenya/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:devhub_kenya/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:devhub_kenya/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:devhub_kenya/features/shop/screens/product_details/widgets/products_meta_data.dart';
import 'package:devhub_kenya/features/shop/screens/product_details/widgets/rating_share.dart';
import 'package:devhub_kenya/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/constants/enums.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = DHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const DBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Product Image slider
             DProductImageSlider(product: product),

            /// Product Details
            Padding(
              padding: const EdgeInsets.only(
                  right: DSizes.defaultSpace,
                  left: DSizes.defaultSpace,
                  bottom: DSizes.defaultSpace),
              child: Column(
                children: [
                  /// Ratings
                  const DRatingAndShare(),

                  /// Price, title,stock,brand
                  DProductMetaData(product: product),

                  /// Attributes
                  if(product.productType == ProductType.variable.toString())
                  DProductAttributes(product:product),
                  if(product.productType == ProductType.variable.toString())
                  const SizedBox(height: DSizes.spaceBtwSections),

                  /// Checkout Button
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('Checkout'))),
                  const SizedBox(height: DSizes.spaceBtwSections),

                  /// Description
                  const DSectionHeading(
                      title: 'Description', showActionButton: false),
                  const SizedBox(height: DSizes.spaceBtwItems),
                ReadMoreText(
                  product.description ?? '',
                  trimLines: 2,
                  colorClickableText: Colors.pink,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: '.....Show more',
                  trimExpandedText: '.......Show less',
                  moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: DColors.primary),
                  lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: DColors.primary),
                ),


                  /// Reviews
                  const Divider(),
                  const SizedBox(height: DSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const DSectionHeading(title: 'Reviews(199)', showActionButton: false),
                      IconButton(
                          onPressed: () => Get.to(()=> const ProductReviewScreeen()),
                          icon: const Icon(Iconsax.arrow_right_3, size: 18)),
                    ],
                  ),
                  const SizedBox(height: DSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
