import 'package:devhub_kenya/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:devhub_kenya/common/widgets/icons/d_circular_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class DFavouriteICon extends StatelessWidget {
  const DFavouriteICon({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteController());
    return const DCircularIcon(icon: Iconsax.heart5, color: Colors.red);
  }
}