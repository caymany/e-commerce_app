import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devhub_kenya/data/repositories/authentication/authentication_repository.dart';
import 'package:get/get.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<AddressModel>> fetchUserAddresses() async {
    try{
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if(userId.isEmpty) throw ' Unable to find user information. Try again later';

      final result = await _db.collection('Users').doc(userId).collection('Addresses').get();
      return result.docs.map((documentSnapshot) => AddressModel.fromDocumentSnapshot(documentSnapshot)).toList();
    }
        catch (e) {
      throw 'Something went wrong. Please try again';
        }
  }
}