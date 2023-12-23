import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/popups/shimmer_loader.dart';
import 'package:flutter/material.dart';

class DCategoryShimmer extends StatelessWidget {
  const DCategoryShimmer({super.key, this.itemCount = 6,});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
          shrinkWrap: true,
          itemCount: itemCount,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, __) =>
          const SizedBox(width: DSizes.spaceBtwItems),
          itemBuilder: (_, __) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// Image
                DShimmerEffect(width: 55, height: 55, radius: 55),
                SizedBox(height: DSizes.spaceBtwItems / 2),

                /// Text
                DShimmerEffect(width: 55, height: 8),
              ],
            );
          }
      ),
    );
  }
}
