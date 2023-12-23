import 'package:devhub_kenya/common/widgets/layout/grid_layout.dart';
import 'package:devhub_kenya/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DSortableProducts extends StatelessWidget {
  const DSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged : (value) {},
          items: ['Name', 'Highest Price','Lowest Price','Sale','Newest','Popularity'].map((option) => DropdownMenuItem(value: option, child: Text(option))).toList(),
        ),
        const SizedBox(height: DSizes.spaceBtwItems),

        ///Products Section
        DGridLayout(itemCount: 8, itemBuilder: (_, index) => const DProductCardVertical()),
      ],
    );
  }
}