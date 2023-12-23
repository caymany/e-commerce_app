import 'package:devhub_kenya/common/widgets/brands/brand_showcase.dart';
import 'package:devhub_kenya/common/widgets/layout/grid_layout.dart';
import 'package:devhub_kenya/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:devhub_kenya/common/widgets/texts/section_heading.dart';
import 'package:devhub_kenya/features/shop/models/category_model.dart';
import 'package:devhub_kenya/utils/constants/image_strings.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class DCategoryTab extends StatelessWidget {
  const DCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children:[
        Padding(
        padding: const EdgeInsets.all(DSizes.defaultSpace),
        child: Column(
          children: [
            /// Brands
            const DBrandShowCase(images: [DImages.canonPrixma, DImages.canonG3420, DImages.hpMf24]),
            const SizedBox(height: DSizes.spaceBtwItems),
            /// Products
            DSectionHeading(title: 'You might like', showActionButton: true,onPressed: (){}),
            const SizedBox(height: DSizes.spaceBtwItems),

            DGridLayout(itemCount: 4, itemBuilder: (_, index) => const DProductCardVertical()),
            const SizedBox(height: DSizes.spaceBtwSections),
          ],
        ),
      ),
    ],
    );
  }
}
