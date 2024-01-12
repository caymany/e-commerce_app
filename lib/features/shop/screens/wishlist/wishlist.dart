import 'package:devhub_kenya/common/widgets/appbar/appbar.dart';
import 'package:devhub_kenya/common/widgets/icons/d_circular_icon.dart';
import 'package:devhub_kenya/common/widgets/layout/grid_layout.dart';
import 'package:devhub_kenya/common/widgets/loaders/animation_loader.dart';
import 'package:devhub_kenya/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:devhub_kenya/features/shop/controllers/product/favorites_controller.dart';
import 'package:devhub_kenya/features/shop/screens/home/home.dart';
import 'package:devhub_kenya/navigation_menu.dart';
import 'package:devhub_kenya/utils/constants/image_strings.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/helpers/cloud_helper_function.dart';
import 'package:devhub_kenya/utils/shimmers/vertical_product_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
    return Scaffold(
      appBar: DAppBar(
        title:
            Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          DCircularIcon(
              icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen())),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(DSizes.defaultSpace),
          child: FutureBuilder(
              future: controller.favoriteProducts(),
              builder: (context, snapshot) {
                /// Nothing found widget
                final emptyWidget = DAnimationLoaderWidget(
                  text: 'Whoops! Wishlist is Empty...',
                  animation: DImages.emptyCart,
                  showAction: true,
                  actionText: 'Let\'s add some',
                  onActionPressed: () => Get.off(() => const NavigationMenu()),
                );

                const loader = DVerticalProductShimmer(itemCount: 6);
                final widget = DCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot,
                    loader: loader,
                    nothingFound: emptyWidget);
                if (widget != null) return widget;

                final products = snapshot.data!;
                return DGridLayout(
                    itemCount: products.length,
                    itemBuilder: (_, index) =>
                        DProductCardVertical(product: products[index]));
              }),
        ),
      ),
    );
  }
}
