import 'package:devhub_kenya/common/widgets/products/cart/add_remove_button.dart';
import 'package:devhub_kenya/common/widgets/products/cart/cart_item.dart';
import 'package:devhub_kenya/common/widgets/texts/product_price_text.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class DCartItems extends StatelessWidget {
  const DCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(height: DSizes.defaultSpace),
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children: [
          const DCartItem(),
          if (showAddRemoveButtons)
            const SizedBox(height: DSizes.spaceBtwItems),
          if (showAddRemoveButtons)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 70),
                    DProductQuantityWithAddRemove(),
                  ],
                ),
                DProductPriceText(price: ' 7,000')
              ],
            )
        ],
      ),
    );
  }
}
