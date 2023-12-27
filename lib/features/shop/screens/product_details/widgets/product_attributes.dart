import 'package:devhub_kenya/common/widgets/chips/choice_chip.dart';
import 'package:devhub_kenya/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:devhub_kenya/common/widgets/texts/product_price_text.dart';
import 'package:devhub_kenya/common/widgets/texts/product_title_text.dart';
import 'package:devhub_kenya/common/widgets/texts/section_heading.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class DProductAttributes extends StatelessWidget {
  const DProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = DHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        DRoundedContainer(
          padding: const EdgeInsets.all(DSizes.md),
          backgroundColor: dark ? DColors.darkerGrey : DColors.grey,
          child: Column(
            children: [
              ///Title, Price and Stock Status
              Row(
                children: [
                  const DSectionHeading(
                      title: 'Variations', showActionButton: false),
                  const SizedBox(width: DSizes.spaceBtwItems),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const DProductTitleText(
                              title: 'Price: ', smallSize: true),
                          const SizedBox(width: DSizes.spaceBtwItems),
                          Text(
                            'Ksh 16,000',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: DSizes.spaceBtwItems),
                          const DProductPriceText(price: '12,000'),
                        ],
                      ),
                      Row(
                        children: [
                          const DProductTitleText(
                              title: 'Stock: ', smallSize: true),
                          Text('In Stock',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      )
                    ],
                  ),

                  ///Actual Price
                ],
              ),

              /// Variation Description
              const DProductTitleText(
                title:
                    'This is the description of the product and it can go upto 4 max lines',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: DSizes.spaceBtwItems),

        ///Attribute
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DSectionHeading(title: 'Color', showActionButton: false),
            const SizedBox(height: DSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                DChoiceChip(
                    text: 'Green', selected: false, onSelected: (value) {}),
                DChoiceChip(
                    text: 'Blue', selected: true, onSelected: (value) {}),
                DChoiceChip(
                    text: 'Pink', selected: false, onSelected: (value) {}),
              ],
            )
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DSectionHeading(title: 'RAM', showActionButton: false),
            const SizedBox(height: DSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                ChoiceChip(
                    label: Text(
                      '4 GB',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .apply(color: Colors.grey),
                    ),
                    selected: false,
                    onSelected: (value) {}),ChoiceChip(
                    label: Text(
                      '8 GB',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .apply(color: Colors.white),
                    ),
                    selected: true,
                    onSelected: (value) {}),ChoiceChip(
                    label: Text(
                      '16 GB',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .apply(color: Colors.grey),
                    ),
                    selected: false,
                    onSelected: (value) {}),
              ],
            )
          ],
        ),
      ],
    );
  }
}
