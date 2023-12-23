import 'package:devhub_kenya/common/widgets/custom_shapes/curved_edges/curved_edges.dart';
import 'package:flutter/material.dart';


class DCurvedEdgesWidget extends StatelessWidget {
  const DCurvedEdgesWidget({
    super.key, this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: DCustomCurvedEdges(),
      child: child,
    );
  }
}