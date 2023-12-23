import 'package:devhub_kenya/common/widgets/appbar/appbar.dart';
import 'package:devhub_kenya/features/personalization/screens/address/add_new_address.dart';
import 'package:devhub_kenya/features/personalization/screens/address/widgets/single_address.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: DColors.primary,
        onPressed: () => Get.to(()=> const AddNewAddressScreen()),
        child: const Icon(Iconsax.add, color: DColors.white),
      ),
      appBar: DAppBar(
        showBackArrow: true,
        title: Text('Addresses', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(DSizes.defaultSpace),
          child: Column(
            children: [
              DSingleAddress(selectedAddress: false),
              DSingleAddress(selectedAddress: true),
              DSingleAddress(selectedAddress: false),

            ],
          ),
        ),
      ),
    );
  }
}
