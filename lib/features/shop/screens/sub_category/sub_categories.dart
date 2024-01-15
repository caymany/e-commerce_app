import 'package:devhub_kenya/common/widgets/appbar/appbar.dart';
import 'package:devhub_kenya/common/widgets/images/d_rounded_images.dart';
import 'package:devhub_kenya/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:devhub_kenya/common/widgets/texts/section_heading.dart';
import 'package:devhub_kenya/features/shop/controllers/category_controller.dart';
import 'package:devhub_kenya/features/shop/models/category_model.dart';
import 'package:devhub_kenya/features/shop/screens/all_products/all_products.dart';
import 'package:devhub_kenya/utils/constants/image_strings.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/helpers/cloud_helper_function.dart';
import 'package:devhub_kenya/utils/shimmers/horizontal_product_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: DAppBar(
        showBackArrow: true,
        title: Text(category.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(DSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const DRoundedImage(
                  width: double.infinity,
                  imageUrl: DImages.banner4,
                  applyImageRadius: true),
              const SizedBox(height: DSizes.spaceBtwSections),

              /// Sub Categories
              FutureBuilder(
                  future: controller.getSubCategories(category.id),
                  builder: (context, snapshot) {
                    /// Handle Loader
                    const loader = DHorizontalProductShimmer();
                    final widget = DCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    // Record found
                    final subCategories = snapshot.data!;

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: subCategories.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        final subCategory = subCategories[index];

                        return FutureBuilder(
                            future: controller.getCategoryProducts(
                                categoryId: subCategory.id),
                            builder: (context, snapshot) {
                              final widget =
                                  DCloudHelperFunctions.checkMultiRecordState(
                                      snapshot: snapshot, loader: loader);
                              if (widget != null) return widget;

                              // Record found
                              final products = snapshot.data!;

                              return Column(
                                /// Heading
                                children: [
                                  DSectionHeading(
                                      title: subCategory.name,
                                      onPressed: () =>
                                          Get.to(() => AllProductsScreen(
                                                title: subCategory.name,
                                                futureMethod: controller
                                                    .getCategoryProducts(
                                                        categoryId:
                                                            subCategory.id,
                                                        limit: -1),
                                              ))),
                                  const SizedBox(
                                      height: DSizes.spaceBtwItems / 2),
                                  SizedBox(
                                    height: 120,
                                    child: ListView.separated(
                                      itemCount: products.length,
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                              width: DSizes.spaceBtwItems),
                                      itemBuilder: (context, index) =>
                                          DProductCardHorizontal(
                                        product: products[index],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
