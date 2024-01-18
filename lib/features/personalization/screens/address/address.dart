import 'package:devhub_kenya/common/widgets/appbar/appbar.dart';
import 'package:devhub_kenya/features/personalization/controllers/address_controller.dart';
import 'package:devhub_kenya/features/personalization/screens/address/add_new_address.dart';
import 'package:devhub_kenya/features/personalization/screens/address/widgets/single_address.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: DColors.primary,
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(Iconsax.add, color: DColors.white),
      ),
      appBar: DAppBar(
        showBackArrow: true,
        title:
            Text('Addresses', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(DSizes.defaultSpace),
          child: Obx(
            () => FutureBuilder(
              key: Key(controller.refreshData.value.toString()),
                future: controller.getAllUserAddresses(),
                builder: (context, snapshot) {
                  /// Helper function
                  final response = DCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot);
                  if (response != null) return response;

                  final addresses = snapshot.data!;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: addresses.length,
                    itemBuilder: (_, index) => DSingleAddress(
                        address: addresses[index],
                        onTap: () => controller.selectAddress(addresses[index])),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
