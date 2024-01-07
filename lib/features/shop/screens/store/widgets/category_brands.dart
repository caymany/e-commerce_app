import 'dart:html';

import 'package:devhub_kenya/common/widgets/brands/brand_showcase.dart';
import 'package:devhub_kenya/features/shop/controllers/product/brands_controller.dart';
import 'package:devhub_kenya/features/shop/models/category_model.dart';
import 'package:devhub_kenya/utils/constants/image_strings.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/helpers/cloud_helper_function.dart';
import 'package:devhub_kenya/utils/shimmers/boxes_shimmer.dart';
import 'package:devhub_kenya/utils/shimmers/list_tile_shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
        future: controller.getBrandForCategory(category.id),
        builder: (context, snapshot) {
          // Handle Loader
          const loader = Column(
            children: [
              DListTileShimmer(),
              SizedBox(height: DSizes.spaceBtwItems),
              DBoxesShimmer(),
              SizedBox(height: DSizes.spaceBtwItems),
            ],
          );
          final widget = DCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, loader: loader);
          if (widget != null) return widget;

          /// Record Found
          final brands = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: brands.length,
            itemBuilder: (_, index) {
              final brand = brands[index];
              return FutureBuilder(
                  future:
                      controller.getBrandProducts(brandId: brand.id, limit: 3),
                  builder: (context, snapshot) {
                    // Handle lOader
                    final widget = DCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    // Record found
                    final products = snapshot.data!;
                    return DBrandShowCase(
                        brand: brand,
                        images: products.map((e) => e.thumbnail).toList());
                  });
            },
          );
        });
  }
}
