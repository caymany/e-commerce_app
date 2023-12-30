import 'package:devhub_kenya/common/widgets/appbar/appbar.dart';
import 'package:devhub_kenya/common/widgets/brands/brand_card.dart';
import 'package:devhub_kenya/common/widgets/products/sortable/sortable_products.dart';
import 'package:devhub_kenya/features/shop/controllers/product/brands_controller.dart';
import 'package:devhub_kenya/features/shop/models/brand_model.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/helpers/cloud_helper_function.dart';
import 'package:devhub_kenya/utils/shimmers/vertical_product_shimmer.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: DAppBar(title: Text(brand.name), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(DSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Details
              DBrandCard(showBorder: true, brand: brand),
              const SizedBox(height: DSizes.spaceBtwSections),

              FutureBuilder(
                future: controller.getBrandProducts(brand.id),
                builder: (context, snapshot) {
                  /// Handle Loader, No record or error Message
                  const loader = DVerticalProductShimmer();
                  final widget = DCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                  if(widget != null) return widget;

                  /// Record Found
                  final brandProducts = snapshot.data!;
                  return DSortableProducts(products: brandProducts);
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
