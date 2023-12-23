import 'package:devhub_kenya/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:devhub_kenya/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class DPrimaryHeaderContainer extends StatelessWidget {
  const DPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DCurvedEdgesWidget(
      child: Container(
        color: DColors.primary,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(
                top: -150,
                right: -250,
                child: DCircularContainer(
                    backgroundColor: DColors.white.withOpacity(0.1))),
            Positioned(
                top: 100,
                right: -300,
                child: DCircularContainer(
                    backgroundColor: DColors.white.withOpacity(0.1))),
            child,
          ],
        ),
      ),
    );
  }
}