import 'package:devhub_kenya/common/widgets/appbar/appbar.dart';
import 'package:devhub_kenya/common/widgets/images/d_rounded_images.dart';
import 'package:devhub_kenya/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:devhub_kenya/common/widgets/texts/section_heading.dart';
import 'package:devhub_kenya/utils/constants/image_strings.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DAppBar(
        showBackArrow: true,
        title: Text('Computers'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(DSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const DRoundedImage(width: double.infinity, imageUrl: DImages.banner4, applyImageRadius: true),
              const SizedBox(height: DSizes.spaceBtwSections),

              /// Sub Categories
              Column(
                /// Heading
                children: [
                  DSectionHeading(title: 'Computers', onPressed: (){}),
                  const SizedBox(height: DSizes.spaceBtwItems/2),

                SizedBox(
                  height: 120,
                  child: ListView.separated(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => const SizedBox(width: DSizes.spaceBtwItems),
                      itemBuilder: (context, index) => const DProductCardHorizontal(),
                  ),
                ),

                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
