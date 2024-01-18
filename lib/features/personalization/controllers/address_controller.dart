import 'package:devhub_kenya/common/widgets/loaders/circular_loader.dart';
import 'package:devhub_kenya/data/repositories/addresses/address_repository.dart';
import 'package:devhub_kenya/data/services/network_manager.dart';
import 'package:devhub_kenya/features/personalization/models/address_model.dart';
import 'package:devhub_kenya/utils/constants/image_strings.dart';
import 'package:devhub_kenya/utils/popups/full_screen_loader.dart';
import 'package:devhub_kenya/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  RxBool refreshData = true.obs;
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());

  /// Fetch all user specific addresses
  Future<List<AddressModel>> getAllUserAddresses() async {
    try {
      final addresses = await addressRepository.fetchUserAddresses();
      selectedAddress.value = addresses.firstWhere(
          (element) => element.selectedAddress,
          orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      DLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
      return [];
    }
  }

  /// Select Address
  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      Get.defaultDialog(
        title:'',
        onWillPop: () async {return false;},
          barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: const DCircularLoader(),
        );
      // Clear the selected field
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(
            selectedAddress.value.id, false);
      }

      // Assign selected address
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      //Set the "Selected" field to true for new selections
      await addressRepository.updateSelectedField(
          selectedAddress.value.id, true);
      Get.back();
    } catch (e) {
      DLoaders.errorSnackBar(
          title: 'Error in selection', message: e.toString());
    }
  }

  /// Add New Address
  Future addNewAddress() async {
    try {
      // Start Loading
      DFullscreenLoader.openLoadingDialog('Storing Address', DImages.newDocerAnim);

      // Check Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        DFullscreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!addressFormKey.currentState!.validate()) {
        DFullscreenLoader.stopLoading();
        return;
      }

      // Save Address
      final address = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        postalCode: postalCode.text.trim(),
        country: country.text.trim(),
        selectedAddress: true,
      );
      final id = await addressRepository.addAddress(address);

      // Update Selected Address Status
      address.id = id;
      await selectedAddress(address);

      // Remove Loader
      DFullscreenLoader.stopLoading();

      // Show Success Message
      DLoaders.successSnackBar(title: 'Congratulations', message: 'Your Address has been saved successfully');

      // Refresh address Data
      refreshData.toggle();

      //Reset Fields
      resetFormFields();

      // Redirect
      Navigator.of(Get.context!).pop();
    } catch (e) {
      DFullscreenLoader.stopLoading();
      DLoaders.errorSnackBar(title: 'Something went wrong', message: e.toString());
    }
  }

  /// reset Forms
  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }
}
