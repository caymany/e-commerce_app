
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/popups/shimmer_loader.dart';
import 'package:flutter/cupertino.dart';

class DBoxesShimmer extends StatelessWidget {
  const DBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column (
      children: [
        Row(
          children: [
            Expanded(child: DShimmerEffect(width: 150, height: 110)),
            SizedBox(width: DSizes.spaceBtwItems),
            Expanded(child: DShimmerEffect(width: 150, height: 110)),
            SizedBox(width: DSizes.spaceBtwItems),
            Expanded(child: DShimmerEffect(width: 150, height: 110)),
          ],
        )
      ],
    );
  }
}