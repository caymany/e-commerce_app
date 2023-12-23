import 'package:devhub_kenya/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:devhub_kenya/common/widgets/texts/section_heading.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/constants/image_strings.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class DBillingPaymentSection extends StatelessWidget {
  const DBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = DHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        DSectionHeading(title: 'Payment Method', buttonTitle: 'Change',onPressed: (){}),
        const SizedBox(height: DSizes.defaultSpace / 2),
        Row(
          children: [
            DRoundedContainer(
              width: 60,
              height: 60,
              backgroundColor: dark ? DColors.light : DColors.white,
              padding: const EdgeInsets.all(DSizes.sm),
              child: const Image(image: AssetImage(DImages.mpesaLogo), fit: BoxFit.cover),
            ),
            const SizedBox(width: DSizes.spaceBtwItems/2),
            Text('M-Pesa', style: Theme.of(context).textTheme.bodyLarge),
          ],
        )
      ],
    );
  }
}
