
import 'package:devhub_kenya/features/shop/models/product_model.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductCartAddToCartButton extends StatelessWidget {
  const ProductCartAddToCartButton({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // if product has variations

        // Else add product to cart
      },
      child: Container(
        decoration: const BoxDecoration(
            color: DColors.dark,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(DSizes.cardRadiusMd),
              bottomRight: Radius.circular(DSizes.productImageRadius),
            )),
        child: const SizedBox(
            width: DSizes.iconLg * 1.2,
            height: DSizes.iconLg * 1.2,
            child: Center(
                child: Icon(Iconsax.add, color: DColors.white))),
      ),
    );
  }
}
