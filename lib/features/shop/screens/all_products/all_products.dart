import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devhub_kenya/common/widgets/appbar/appbar.dart';
import 'package:devhub_kenya/common/widgets/layout/grid_layout.dart';
import 'package:devhub_kenya/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:devhub_kenya/common/widgets/products/sortable/sortable_products.dart';
import 'package:devhub_kenya/features/shop/controllers/product/all_products_controller.dart';
import 'package:devhub_kenya/features/shop/models/product_model.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/helpers/cloud_helper_function.dart';
import 'package:devhub_kenya/utils/shimmers/vertical_product_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen(
      {super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    return Scaffold(
      appBar: DAppBar(title: Text(title), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(DSizes.defaultSpace),
          child: FutureBuilder(
              future: futureMethod ?? controller.fetchProductsByQuery(query),
              builder: (context, snapshot) {
                // Check the state of the Future Builder
                const loader = DVerticalProductShimmer();
                final widget = DCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);

                if(widget!=null) return widget;

                final products = snapshot.data!;

                return DSortableProducts(products: products);
              }
          ),
        ),
      ),
    );
  }
}


