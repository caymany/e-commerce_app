import 'package:devhub_kenya/common/widgets/layout/grid_layout.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/popups/shimmer_loader.dart';
import 'package:flutter/material.dart';

class DVerticalProductShimmer extends StatelessWidget {
  const DVerticalProductShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return DGridLayout(
        itemCount: itemCount,
        itemBuilder: (_, __) => const SizedBox(
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              DShimmerEffect(width: 180, height: 180),
              SizedBox(height: DSizes.spaceBtwItems),


              // Text
              DShimmerEffect(width: 160, height: 15),
              SizedBox(height: DSizes.spaceBtwItems/2),
              DShimmerEffect(width: 110, height: 15),
            ],
          ),
        )
    );
  }
}