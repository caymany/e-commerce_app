import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devhub_kenya/features/shop/models/brand_category_model.dart';
import 'package:devhub_kenya/features/shop/models/brand_model.dart';
import 'package:devhub_kenya/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:devhub_kenya/utils/exceptions/firebase_exceptions.dart';
import 'package:devhub_kenya/utils/exceptions/format_exceptions.dart';
import 'package:devhub_kenya/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  ///  Get all Categories
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection('Brands').get();
      final result =
          snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
      return result;
    } on FirebaseAuthException catch (e) {
      throw DFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw DFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const DFormatException();
    } on PlatformException catch (e) {
      throw DPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get Brands for categories
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {

      QuerySnapshot brandCategoryQuery = await _db.collection('BrandCategory').where('categoryId', isEqualTo: categoryId).get();

      // Extract brandIds form  the documents
      List<String> brandIds = brandCategoryQuery.docs.map((doc) => doc['brandId'] as String).toList();

      // Query to get all documents where brand Id is in the list
      final brandsQuery = await _db.collection('Brands').where(FieldPath.documentId, whereIn: brandIds).limit(2).get();

      // Extract Brand Names and other relevant data from the docs

      List<BrandModel> brands = brandsQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();

      return brands;
      
    } on FirebaseAuthException catch (e) {
      throw DFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw DFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const DFormatException();
    } on PlatformException catch (e) {
      throw DPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
