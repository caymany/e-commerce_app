import 'package:devhub_kenya/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:devhub_kenya/common/widgets/icons/d_circular_icon.dart';
import 'package:devhub_kenya/features/shop/controllers/product/favorites_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class DFavouriteIcon extends StatelessWidget {
  const DFavouriteIcon({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Obx(() => DCircularIcon(
      onPressed:() => controller.toggleFavoriteProduct(productId),
        icon: controller.isFavorite(productId) ? Iconsax.heart5 : Iconsax.heart,
        color: controller.isFavorite(productId) ? Colors.red : null));
  }
}
