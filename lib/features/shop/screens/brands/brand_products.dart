import 'package:devhub_kenya/common/widgets/appbar/appbar.dart';
import 'package:devhub_kenya/common/widgets/brands/brand_card.dart';
import 'package:devhub_kenya/common/widgets/products/sortable/sortable_products.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DAppBar(title: Text('Canon'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(DSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Details
              DBrandCard(showBorder: true),
              SizedBox(height: DSizes.spaceBtwSections),

              DSortableProducts(products: []),
            ],
          ),
        ),
      ),
    );
  }
}
