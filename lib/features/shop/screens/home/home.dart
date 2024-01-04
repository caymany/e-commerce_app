import 'package:devhub_kenya/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:devhub_kenya/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:devhub_kenya/common/widgets/layout/grid_layout.dart';
import 'package:devhub_kenya/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:devhub_kenya/common/widgets/texts/section_heading.dart';
import 'package:devhub_kenya/features/shop/controllers/product/product_controller.dart';
import 'package:devhub_kenya/features/shop/screens/all_products/all_products.dart';
import 'package:devhub_kenya/features/shop/screens/home/widgets/home_catgories.dart';
import 'package:devhub_kenya/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/shimmers/vertical_product_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:devhub_kenya/features/shop/screens/home/widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const DPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// --- Appbar Section
                  DHomeAppbar(),
                  SizedBox(height: DSizes.spaceBtwSections),

                  /// Searchbar
                  DSearchContainer(text: 'Search in Store'),
                  SizedBox(height: DSizes.spaceBtwSections),

                  /// Categories
                  Padding(
                    padding: EdgeInsets.only(left: DSizes.defaultSpace),
                    child: Column(
                      children: [
                        DSectionHeading(
                            title: 'Popular Categories',
                            showActionButton: false,
                            textColor: DColors.white),
                        SizedBox(height: DSizes.spaceBtwItems),

                        /// Scrollable
                        DHomeCategories()
                      ],
                    ),
                  ),
                  SizedBox(height: DSizes.spaceBtwSections),
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(DSizes.defaultSpace),
              child: Column(
                children: [
                  const DPromoSlider(),
                  const SizedBox(height: DSizes.spaceBtwSections),

                  ///Headings
                  DSectionHeading(
                      title: 'Popular Products',
                      onPressed: () => Get.to(() => AllProductsScreen(
                            title: 'Popular Products',
                        futureMethod: controller.fetchAllFeaturedProducts(),
                          ))),
                  const SizedBox(height: DSizes.spaceBtwItems),

                  /// Popular Products
                  Obx(() {
                    if (controller.isLoading.value)  return const DVerticalProductShimmer();

                    if (controller.featuredProducts.isEmpty) {
                      return Center(
                          child: Text('No Data Found',
                              style: Theme.of(context).textTheme.bodyMedium));
                    }
                    return DGridLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuilder: (_, index) => DProductCardVertical(
                          product: controller.featuredProducts[index]),
                    );
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
