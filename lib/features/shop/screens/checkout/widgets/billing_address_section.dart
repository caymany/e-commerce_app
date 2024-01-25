import 'package:devhub_kenya/common/widgets/texts/section_heading.dart';
import 'package:devhub_kenya/features/personalization/controllers/address_controller.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DBillingAddressSection extends StatelessWidget {
  const DBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DSectionHeading(title: 'Shipping Address', buttonTitle: 'change',onPressed: () => addressController.selectNewAddressPopup(context)),
        addressController.selectedAddress.value.id.isNotEmpty ?
        Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(addressController.selectedAddress.value.name, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(width: DSizes.spaceBtwItems),
              Row(
                children: [
                  const Icon(Icons.phone, color: Colors.grey, size: 16),
                  const SizedBox(width: DSizes.spaceBtwItems),
                  Text(addressController.selectedAddress.value.phoneNumber, style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              const SizedBox(height: DSizes.spaceBtwItems/2),
              Row(
                children: [
                  const Icon(Icons.location_history, color: Colors.grey, size: 16),
                  const SizedBox(width: DSizes.spaceBtwItems),
                  Text(addressController.selectedAddress.value.toString(), style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ],
          ),
        ) : Text('Select Address', style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
