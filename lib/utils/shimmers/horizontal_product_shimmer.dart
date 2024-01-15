import 'dart:html';

import 'package:devhub_kenya/common/widgets/layout/grid_layout.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/popups/shimmer_loader.dart';
import 'package:flutter/material.dart';

class DHorizontalProductShimmer extends StatelessWidget {
  const DHorizontalProductShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: DSizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        separatorBuilder: (context, index) => const SizedBox(width: DSizes.spaceBtwItems),
        itemBuilder: (_, __) => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Image
            DShimmerEffect(width: 120, height: 120),
             SizedBox(width: DSizes.spaceBtwItems),

            /// Text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: DSizes.spaceBtwItems / 2),
                DShimmerEffect(width: 160, height: 15),
                SizedBox(height: DSizes.spaceBtwItems/2),
                DShimmerEffect(width: 110, height: 15),
                SizedBox(height: DSizes.spaceBtwItems/2),
                DShimmerEffect(width: 80 , height: 15),
                Spacer(),
              ],
            )
          ],
        ),
       ),
    );
  }
}