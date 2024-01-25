import 'package:devhub_kenya/features/shop/controllers/product/cart_controller.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/helpers/pricing_calculator.dart';
import 'package:flutter/material.dart';

class DBillingAmountSection extends StatelessWidget {
  const DBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    return Column(
      children: [
        /// Subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
            Text('Ksh $subTotal', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: DSizes.spaceBtwItems / 2),

        /// Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('Ksh ${DPricingCalculator.calculateShippingCost(subTotal, 'Nairobi')}', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: DSizes.spaceBtwItems / 2),

        ///Order Tax
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('VAT', style: Theme.of(context).textTheme.bodyMedium),
            Text('Ksh ${DPricingCalculator.calculateTax(subTotal, 'Nairobi')}', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: DSizes.spaceBtwItems / 2),
        ///Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium),
            Text('Ksh ${DPricingCalculator.calculateTotalPrice(subTotal, 'Nairobi')}', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: DSizes.spaceBtwItems / 2),
      ],
    );
  }
}
