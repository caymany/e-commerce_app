import 'package:devhub_kenya/common/widgets/appbar/appbar.dart';
import 'package:devhub_kenya/common/widgets/brands/brand_card.dart';
import 'package:devhub_kenya/common/widgets/layout/grid_layout.dart';
import 'package:devhub_kenya/common/widgets/products/sortable/sortable_products.dart';
import 'package:devhub_kenya/common/widgets/texts/section_heading.dart';
import 'package:devhub_kenya/features/shop/controllers/product/brands_controller.dart';
import 'package:devhub_kenya/features/shop/models/brand_model.dart';
import 'package:devhub_kenya/features/shop/screens/brands/brand_products.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/shimmers/brand_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: const DAppBar(title: Text('All Brands'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(DSizes.defaultSpace),
          child: Column(
            children: [
              /// Heading
              const DSectionHeading(title: 'Brands', showActionButton: false),
              const SizedBox(height: DSizes.spaceBtwItems),

              ///Brands
              Obx(
                    () {
                  if (brandController.isLoading.value) return const DBrandShimmer();

                  if (brandController.allBrands.isEmpty) {
                    return Center(
                        child: Text('No Data Found', style: Theme
                            .of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: DColors.White)));
                  }
                  return DGridLayout(
                    itemCount: brandController.allBrands.length,
                    mainAxisExtent: 80,
                    itemBuilder: (_, index) {
                      final brand = brandController.allBrands[index];
                      return DBrandCard(showBorder: true, brand: brand, onTap: () => Get.to(() => BrandProducts(brand: brand)));
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
