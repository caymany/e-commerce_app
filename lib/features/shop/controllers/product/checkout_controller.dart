import 'package:devhub_kenya/common/widgets/texts/section_heading.dart';
import 'package:devhub_kenya/features/shop/models/payment_method_model.dart';
import 'package:devhub_kenya/features/shop/screens/checkout/widgets/payment_tile.dart';
import 'package:devhub_kenya/utils/constants/image_strings.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  /// Variables
  final Rx<PaymentMethodModel> selectedPaymentMethod =
      PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value =
        PaymentMethodModel(image: DImages.mpesaLogo, name: 'Mpesa');
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(DSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DSectionHeading(
                  title: 'Select Payment Method', showActionButton: false),
              const SizedBox(height: DSizes.spaceBtwSections),
              DPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Mpesa', image: DImages.mpesaLogo)),
              const SizedBox(height: DSizes.spaceBtwItems / 2),
              DPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Paypal', image: DImages.paypalLogo)),
              const SizedBox(height: DSizes.spaceBtwItems / 2),
              DPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Mastercard', image: DImages.mastercardLogo)),
              const SizedBox(height: DSizes.spaceBtwItems / 2),
              DPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Visa', image: DImages.visaLogo)),
              const SizedBox(height: DSizes.spaceBtwItems / 2),
              const SizedBox(height: DSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
