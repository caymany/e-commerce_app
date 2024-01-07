import 'package:devhub_kenya/common/widgets/brands/brand_showcase.dart';
import 'package:devhub_kenya/common/widgets/layout/grid_layout.dart';
import 'package:devhub_kenya/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:devhub_kenya/common/widgets/texts/section_heading.dart';
import 'package:devhub_kenya/features/shop/controllers/category_controller.dart';
import 'package:devhub_kenya/features/shop/models/category_model.dart';
import 'package:devhub_kenya/features/shop/models/product_model.dart';
import 'package:devhub_kenya/features/shop/screens/all_products/all_products.dart';
import 'package:devhub_kenya/features/shop/screens/store/widgets/category_brands.dart';
import 'package:devhub_kenya/utils/constants/image_strings.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/helpers/cloud_helper_function.dart';
import 'package:devhub_kenya/utils/shimmers/vertical_product_shimmer.dart';
import 'package:flutter/material.dart';

class DCategoryTab extends StatelessWidget {
  const DCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(DSizes.defaultSpace),
          child: Column(
            children: [
              /// Brands
              CategoryBrands(category: category),
              const SizedBox(height: DSizes.spaceBtwItems),

              /// Products
              FutureBuilder(
                  future:
                      controller.getCategoryProducts(categoryId: category.id),
                  builder: (context, snapshot) {
                    /// Helper function for loader and other errors
                    final response =
                        DCloudHelperFunctions.checkMultiRecordState(
                            snapshot: snapshot,
                            loader: const DVerticalProductShimmer());
                    if (response != null) return response;

                    /// Record found
                    final products = snapshot.data!;

                    return Column(
                      children: [
                        DSectionHeading(
                          title: 'You might like',
                          showActionButton: true,
                          onPressed: () => AllProductsScreen(title: category.name,
                          futureMethod: controller.getCategoryProducts(categoryId: category.id, limit: -1)),
                        ),
                        const SizedBox(height: DSizes.spaceBtwItems),
                        DGridLayout(
                            itemCount: products.length,
                            itemBuilder: (_, index) =>
                                DProductCardVertical(product: products[index])),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
