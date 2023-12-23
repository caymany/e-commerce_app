import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class DBillingAmountSection extends StatelessWidget {
  const DBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
            Text('Ksh 7,500', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: DSizes.spaceBtwItems / 2),

        /// Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('Ksh 200', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: DSizes.spaceBtwItems / 2),

        ///Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium),
            Text('Ksh 1200', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: DSizes.spaceBtwItems / 2),
      ],
    );
  }
}
