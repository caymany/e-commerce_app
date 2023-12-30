import 'package:devhub_kenya/common/widgets/appbar/appbar.dart';
import 'package:devhub_kenya/common/widgets/appbar/tabbar.dart';
import 'package:devhub_kenya/common/widgets/brands/brand_card.dart';
import 'package:devhub_kenya/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:devhub_kenya/common/widgets/layout/grid_layout.dart';
import 'package:devhub_kenya/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:devhub_kenya/common/widgets/texts/section_heading.dart';
import 'package:devhub_kenya/features/shop/controllers/category_controller.dart';
import 'package:devhub_kenya/features/shop/controllers/product/brands_controller.dart';
import 'package:devhub_kenya/features/shop/screens/brands/all_brands.dart';
import 'package:devhub_kenya/features/shop/screens/brands/brand_products.dart';
import 'package:devhub_kenya/features/shop/screens/store/widgets/category_tab.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/helpers/helper_functions.dart';
import 'package:devhub_kenya/utils/shimmers/brand_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: DAppBar(
          title:
          Text('Store', style: Theme
              .of(context)
              .textTheme
              .headlineMedium),
          actions: [
            DCartCountericon(onPressed: () {}, iconColor: Colors.black),
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrollable) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: DHelperFunctions.isDarkMode(context)
                      ? DColors.black
                      : DColors.white,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(DSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [

                        /// Search Bar
                        const SizedBox(height: DSizes.spaceBtwItems),
                        const DSearchContainer(
                            text: 'Search in Store',
                            showBorder: true,
                            showBackground: false,
                            padding: EdgeInsets.zero),
                        const SizedBox(height: DSizes.spaceBtwSections),

                        ///-- Featured Brands
                        DSectionHeading(
                            title: 'Featured Brands',
                            onPressed: () =>
                                Get.to(() => const AllBrandsScreen())),
                        const SizedBox(height: DSizes.spaceBtwItems),

                        Obx(
                              () {
                            if (brandController.isLoading.value)
                              return const DBrandShimmer();

                            if (brandController.featuredBrands.isEmpty) {
                              return Center(
                                child: Text('No Data Found', style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .apply(color: DColors.White)));
                            }
                            return DGridLayout(
                              itemCount: brandController.featuredBrands.length,
                              mainAxisExtent: 80,
                              itemBuilder: (_, index) {
                                final brand = brandController.featuredBrands[index];
                                return DBrandCard(showBorder: true, brand: brand, onTap: () => Get.to(() => BrandProducts(brand: brand)));
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  /// Tabs View
                  bottom: DTabBar(
                    tabs: categories
                        .map((category) => Tab(child: Text(category.name)))
                        .toList(),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: categories
                  .map((category) => DCategoryTab(category: category))
                  .toList(),
            )),
      ),
    );
  }
}
