import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class DShadowStyle {
  static final verticalProductShadow = BoxShadow(
    color: DColors.darkerGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );

  static final horizontalProductShadow = BoxShadow(
  color: DColors.darkerGrey.withOpacity(0.1),
  blurRadius: 50,
  spreadRadius: 7,
  offset: const Offset(0, 2)
  );
}