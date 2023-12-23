import 'package:devhub_kenya/common/widgets/appbar/appbar.dart';
import 'package:devhub_kenya/common/widgets/appbar/tabbar.dart';
import 'package:devhub_kenya/common/widgets/brands/brand_card.dart';
import 'package:devhub_kenya/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:devhub_kenya/common/widgets/layout/grid_layout.dart';
import 'package:devhub_kenya/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:devhub_kenya/common/widgets/texts/section_heading.dart';
import 'package:devhub_kenya/features/shop/controllers/category_controller.dart';
import 'package:devhub_kenya/features/shop/screens/brands/all_brands.dart';
import 'package:devhub_kenya/features/shop/screens/store/widgets/category_tab.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: DAppBar(
          title: Text('Store', style: Theme
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
                            title: 'Featured Brands', onPressed: () => Get.to(() => const AllBrandsScreen())),
                        const SizedBox(height: DSizes.spaceBtwItems),

                        DGridLayout(
                            itemCount: 4,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              return const DBrandCard(showBorder: true);
                            }),
                      ],
                    ),
                  ),

                  /// Tabs View
                  bottom: DTabBar(
                    tabs: categories.map((category) => Tab(child: Text(category.name))).toList(),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: categories.map((category) => DCategoryTab(category: category)).toList(),
            )
        ),
      ),
    );
  }
}


