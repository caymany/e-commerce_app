import 'package:devhub_kenya/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:devhub_kenya/features/personalization/controllers/address_controller.dart';
import 'package:devhub_kenya/features/personalization/models/address_model.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class DSingleAddress extends StatelessWidget {
  const DSingleAddress({super.key, required this.onTap, required this.address});

  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    final dark = DHelperFunctions.isDarkMode(context);
    return Obx(() {
      final selectedAddressId = controller.selectedAddress.value.id;
      final selectedAddress = selectedAddressId == address.id;
      return InkWell(
        onTap: onTap,
        child: DRoundedContainer(
          padding: const EdgeInsets.all(DSizes.md),
          width: double.infinity,
          showBorder: true,
          backgroundColor: selectedAddress
              ? DColors.primary.withOpacity(0.5)
              : Colors.transparent,
          borderColor: selectedAddress
              ? Colors.transparent
              : dark
                  ? DColors.darkerGrey
                  : DColors.grey,
          margin: const EdgeInsets.only(bottom: DSizes.spaceBtwItems),
          child: Stack(
            children: [
              Positioned(
                right: 5,
                top: 0,
                child: Icon(
                  selectedAddress ? Iconsax.tick_circle5 : null,
                  color: selectedAddress
                      ? dark
                          ? DColors.light
                          : DColors.dark
                      : null,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: DSizes.sm / 2),
                  Text(address.formattedPhoneNo,
                      maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: DSizes.sm / 2),
                  Text(
                    address.toString(),
                    softWrap: true,
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
