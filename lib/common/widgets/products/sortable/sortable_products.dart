import 'package:devhub_kenya/common/widgets/layout/grid_layout.dart';
import 'package:devhub_kenya/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:devhub_kenya/features/shop/controllers/product/all_products_controller.dart';
import 'package:devhub_kenya/features/shop/models/product_model.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class DSortableProducts extends StatelessWidget {
  const DSortableProducts({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          value: controller.selectedSortOption.value,
          onChanged: (value) {
            // Call Sort product method
            controller.sortProducts(value!);
          },
          items: ['Name', 'Highest Price', 'Lowest Price', 'Sale', 'Newest']
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(height: DSizes.spaceBtwItems),

        ///Products Section
        Obx(() => DGridLayout(
            itemCount: controller.products.length,
            itemBuilder: (_, index) =>
                DProductCardVertical(product: controller.products[index]))),
      ],
    );
  }
}
