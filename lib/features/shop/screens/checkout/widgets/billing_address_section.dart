import 'package:devhub_kenya/common/widgets/texts/section_heading.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class DBillingAddressSection extends StatelessWidget {
  const DBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DSectionHeading(title: 'Shipping Address', buttonTitle: 'change',onPressed: (){}),
        Text('Devhub Kenya', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: DSizes.spaceBtwItems),

        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: DSizes.spaceBtwItems),
            Text('0745577085', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: DSizes.spaceBtwItems/2),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: DSizes.spaceBtwItems),
            Text('0745577085', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: DSizes.spaceBtwItems/2),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: DSizes.spaceBtwItems),
            Text('0745577085', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: DSizes.spaceBtwItems/2),
      ],
    );
  }
}
