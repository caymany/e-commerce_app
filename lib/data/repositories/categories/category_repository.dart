import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devhub_kenya/features/shop/models/category_model.dart';
import 'package:devhub_kenya/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:devhub_kenya/utils/exceptions/firebase_exceptions.dart';
import 'package:devhub_kenya/utils/exceptions/format_exceptions.dart';
import 'package:devhub_kenya/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();


  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get All Categories
  Future<List<CategoryModel>> getAllCategories() async {
    try{
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
      return list;
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

  /// Get Sub Categories
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try{
      final snapshot = await _db.collection('Categories').where('ParentId', isEqualTo: categoryId).get();
      final list = snapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw DFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw DPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Upload Categories to cloud Firebase
}