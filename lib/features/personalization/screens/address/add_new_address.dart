import 'package:devhub_kenya/common/widgets/appbar/appbar.dart';
import 'package:devhub_kenya/features/personalization/controllers/address_controller.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
      appBar:
          const DAppBar(showBackArrow: true, title: Text('Add New Address')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(DSizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              children: [
                TextFormField(
                    controller: controller.name,
                    validator: (value) =>
                        DValidator.validateEmptyText('Name', value),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.user), labelText: 'Name')),
                const SizedBox(height: DSizes.spaceBtwInputFields),
                TextFormField(
                    controller: controller.phoneNumber,
                    validator: DValidator.validatePhoneNumber,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.mobile),
                        labelText: 'Phone Number')),
                const SizedBox(height: DSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                            controller: controller.street,
                            validator: (value) =>
                                DValidator.validateEmptyText('Street', value),
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Iconsax.building_31),
                                labelText: 'Street'))),
                    const SizedBox(width: DSizes.spaceBtwInputFields),
                    Expanded(
                        child: TextFormField(
                            controller: controller.postalCode,
                            validator: (value) => DValidator.validateEmptyText('Postal Code', value),
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Iconsax.code),
                                labelText: 'Postal Code'))),
                    const SizedBox(height: DSizes.spaceBtwInputFields),
                  ],
                ),
                const SizedBox(height: DSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                            controller: controller.city,
                            validator: (value) => DValidator.validateEmptyText('City', value),
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Iconsax.building),
                                labelText: 'City'))),
                    const SizedBox(width: DSizes.spaceBtwInputFields),
                    Expanded(
                        child: TextFormField(
                            controller: controller.state,
                            validator: (value) => DValidator.validateEmptyText('State', value),
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Iconsax.activity),
                                labelText: 'State'))),
                  ],
                ),
                const SizedBox(height: DSizes.spaceBtwInputFields),
                TextFormField(
                    controller: controller.country,
                    validator: (value) => DValidator.validateEmptyText('Country', value),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.global),
                      labelText: 'Country',
                    )),
                const SizedBox(height: DSizes.defaultSpace),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => controller.addNewAddress(), child: const Text('Save'))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
