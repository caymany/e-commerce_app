import 'package:cached_network_image/cached_network_image.dart';
import 'package:devhub_kenya/common/widgets/brands/brand_card.dart';
import 'package:devhub_kenya/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:devhub_kenya/features/shop/models/brand_model.dart';
import 'package:devhub_kenya/features/shop/screens/brands/brand_products.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/helpers/helper_functions.dart';
import 'package:devhub_kenya/utils/popups/shimmer_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DBrandShowCase extends StatelessWidget {
  const DBrandShowCase({
    super.key,
    required this.images,
    required this.brand,
  });

  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: DRoundedContainer(
        showBorder: true,
        borderColor: DColors.darkerGrey,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(DSizes.md),
        margin: const EdgeInsets.only(bottom: DSizes.spaceBtwItems),
        child: Column(
          children: [
            DBrandCard(showBorder: false, brand: brand),
            const SizedBox(height: DSizes.spaceBtwItems),
 
            /// Brand Images
            Row(
              children: images
                  .map((image) => brandTopProductImageWidget(image, context))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: DRoundedContainer(
        height: 100,
        backgroundColor: DHelperFunctions.isDarkMode(context)
            ? DColors.darkerGrey
            : DColors.light,
        margin: const EdgeInsets.only(right: DSizes.sm),
        padding: const EdgeInsets.all(DSizes.md),
        child: CachedNetworkImage(
          fit: BoxFit.contain,
          imageUrl: image,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              const DShimmerEffect(width: 100, height: 100),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
