import 'package:devhub_kenya/common/widgets/appbar/appbar.dart';
import 'package:devhub_kenya/common/widgets/loaders/animation_loader.dart';
import 'package:devhub_kenya/features/shop/controllers/product/cart_controller.dart';
import 'package:devhub_kenya/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:devhub_kenya/features/shop/screens/checkout/checkout.dart';
import 'package:devhub_kenya/navigation_menu.dart';
import 'package:devhub_kenya/utils/constants/image_strings.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: DAppBar(
          showBackArrow: true,
          title: Text('Cart', style: Theme.of(context).textTheme.titleLarge)),
      body: Obx(() {
        // Nothing found in cart
        final emptyWidget = DAnimationLoaderWidget(
          text: 'Whoops! Cart is Empty',
          animation: DImages.cartAnim,
          showAction: true,
          actionText: 'Let\'s fill it',
          onActionPressed: () => Get.offAll(() => const NavigationMenu()),
        );

        if (controller.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(DSizes.defaultSpace),
              child: DCartItems(),
            ),
          );
        }
      }),
      bottomNavigationBar: controller.cartItems.isEmpty
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.all(DSizes.defaultSpace),
              child: ElevatedButton(
                onPressed: () => Get.to(() => const CheckoutScreen()),
                child: Obx(
                    () => Text('Checkout ${controller.totalCartPrice.value}')),
              ),
            ),
    );
  }
}
