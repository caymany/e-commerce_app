import 'package:devhub_kenya/common/widgets/appbar/appbar.dart';
import 'package:devhub_kenya/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:devhub_kenya/common/widgets/products/cart/coupon_widget.dart';
import 'package:devhub_kenya/common/widgets/success_screen/success_screen.dart';
import 'package:devhub_kenya/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:devhub_kenya/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:devhub_kenya/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:devhub_kenya/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/constants/image_strings.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = DHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: DAppBar(
          showBackArrow: true,
          title: Text('Order review',
              style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(DSizes.defaultSpace),
          child: Column(
            children: [
              const DCartItems(showAddRemoveButtons: false),
              const SizedBox(height: DSizes.spaceBtwItems),

              /// Cupon Container
              DCouponCode(dark: dark),
              const SizedBox(height: DSizes.spaceBtwItems),

              /// Billing Section
              DRoundedContainer(
                padding: const EdgeInsets.all(DSizes.md),
                showBorder: true,
                backgroundColor: dark ? DColors.black : DColors.white,
                child: const Column(
                  children: [
                    /// Pricing
                    DBillingAmountSection(),
                    SizedBox(height: DSizes.spaceBtwItems),

                    /// Divider
                    Divider(),
                    SizedBox(height: DSizes.spaceBtwItems),

                    /// Payment Methods
                    DBillingPaymentSection(),

                    /// Addresses
                    DBillingAddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(DSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => SuccessScreen(
                image: DImages.blueSuccess,
                title: 'Payment Successful',
                subTitle: 'Payment has been confirmed, Shipping will start right away',
                onPressed: (){},
            ),
            ),
            child: const Text('Checkout Ksh 11,000')),
      ),
    );
  }
}
