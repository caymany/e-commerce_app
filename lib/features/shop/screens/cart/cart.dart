import 'package:devhub_kenya/common/widgets/appbar/appbar.dart';
import 'package:devhub_kenya/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:devhub_kenya/features/shop/screens/checkout/checkout.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(
          showBackArrow: true,
          title: Text('Cart', style: Theme.of(context).textTheme.titleLarge)),
      body: const Padding(
        padding: EdgeInsets.all(DSizes.defaultSpace),
        child: DCartItems(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(DSizes.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(() => const CheckoutScreen()), child: const Text('Checkout Ksh 7,000')),
      ),
    );
  }
}


