import 'package:cached_network_image/cached_network_image.dart';
import 'package:devhub_kenya/common/widgets/appbar/appbar.dart';
import 'package:devhub_kenya/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:devhub_kenya/common/widgets/icons/d_circular_icon.dart';
import 'package:devhub_kenya/common/widgets/images/d_rounded_images.dart';
import 'package:devhub_kenya/common/widgets/products/favorite_icon/favorite_icon.dart';
import 'package:devhub_kenya/features/shop/controllers/product/images_controller.dart';
import 'package:devhub_kenya/features/shop/models/product_model.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class DProductImageSlider extends StatelessWidget {
  const DProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = DHelperFunctions.isDarkMode(context);

    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);
    return DCurvedEdgesWidget(
      child: Container(
        color: dark ? DColors.darkerGrey : DColors.light,
        child: Stack(
          children: [
            ///Main Large Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(DSizes.productImageRadius * 2),
                child: Center(child: Obx(() {
                  final image = controller.selectedProductImage.value;
                  return GestureDetector(
                    onTap: () => controller.showEnlargedImage(image),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      progressIndicatorBuilder: (_, __, downloadProgress) =>
                      CircularProgressIndicator(value: downloadProgress.progress,color: DColors.primary),
                    ),
                  );
                })),
              ),
            ),

            /// Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: DSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: DSizes.spaceBtwItems),
                  itemBuilder: (_, index) => Obx(
                      () {
                        final imageSelected = controller.selectedProductImage.value == images[index];
                        return DRoundedImage(
                          width: 80,
                          isNetworkImage: true,
                          border: Border.all(color: imageSelected? DColors.primary : Colors.transparent),
                          padding: const EdgeInsets.all(DSizes.sm),
                          onPressed: () => controller.selectedProductImage.value = images[index],
                          imageUrl: images[index],
                          backgroundColor: dark ? DColors.dark : DColors.white,
                        );
                      }
                  ),
                ),
              ),
            ),
            DAppBar(
              showBackArrow: true,
              actions: [
                DFavouriteIcon(productId: product.id),
              ],
            )
          ],
        ),
      ),
    );
  }
}
