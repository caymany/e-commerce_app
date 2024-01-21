import 'package:devhub_kenya/common/widgets/products/cart/add_remove_button.dart';
import 'package:devhub_kenya/common/widgets/products/cart/cart_item.dart';
import 'package:devhub_kenya/common/widgets/texts/product_price_text.dart';
import 'package:devhub_kenya/features/shop/controllers/product/cart_controller.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DCartItems extends StatelessWidget {
  const DCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Obx(
      () => ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (_, __) =>
              const SizedBox(height: DSizes.defaultSpace),
          itemCount: cartController.cartItems.length,
          itemBuilder: (_, index) => Obx(() {
                final item = cartController.cartItems[index];
                return Column(
                  children: [
                    DCartItem(cartItem: item),
                    if (showAddRemoveButtons)
                      const SizedBox(height: DSizes.spaceBtwItems),
                    if (showAddRemoveButtons)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 70),
                              DProductQuantityWithAddRemove(
                                quantity: item.quantity,
                                add: () => cartController.addOneToCart(item),
                                remove: () => cartController.removeOneItemFromCart(item),
                              ),
                            ],
                          ),
                          DProductPriceText(price: (item.price * item.quantity).toStringAsFixed(1)),
                        ],
                      )
                  ],
                );
              })),
    );
  }
}
