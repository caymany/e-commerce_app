import 'package:devhub_kenya/common/widgets/layout/grid_layout.dart';
import 'package:devhub_kenya/utils/popups/shimmer_loader.dart';
import 'package:flutter/material.dart';

class DBrandShimmer extends StatelessWidget {
  const DBrandShimmer({super.key, this.itemCount = 4});
  
  final int itemCount;
  
  @override
  Widget build(BuildContext context) {
    return DGridLayout(
        itemCount: itemCount,
        itemBuilder: (_,__) => const DShimmerEffect(width: 300, height: 80),
    );
  }
}