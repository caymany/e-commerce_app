import 'package:devhub_kenya/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:devhub_kenya/common/widgets/images/d_circular_images.dart';
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

class DProductMetaData extends StatelessWidget {
  const DProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
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
              child: Text('$salePercentage%',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: DColors.black)),
            ),
            const SizedBox(width: DSizes.spaceBtwItems),

            /// Price
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              Text('${product.price}',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .apply(decoration: TextDecoration.lineThrough)),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              const SizedBox(width: DSizes.spaceBtwItems),
            DProductPriceText(
                price: controller.getProductPrice(product), isLarge: true),
          ],
        ),
        const SizedBox(height: DSizes.spaceBtwItems / 1.5),

        /// Title
        DProductTitleText(title: product.title),
        const SizedBox(height: DSizes.spaceBtwItems / 1.5),

        /// Stock Status
        Row(
          children: [
            const DProductTitleText(title: 'Status'),
            const SizedBox(width: DSizes.spaceBtwItems / 1.5),
            Text(controller.getProductStockStatus(product.stock),
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),

        const SizedBox(height: DSizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            DCircularImage(
              image: product.brand != null ? product.brand!.image : '',
              width: 32,
              height: 32,
              isNetworkImage: true,
            ),
            DBrandTitleWithVerifiedIcon(
                title: product.brand != null ? product.brand!.name : '',
                brandTextSizes: TextSizes.medium),
          ],
        ),
      ],
    );
  }
}
