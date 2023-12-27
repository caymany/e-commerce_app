import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productCount;

  BrandModel(
      {required this.id, required this.image, required this.name, this.isFeatured, this.productCount});

  /// Empty Helper Function
  static BrandModel empty() => BrandModel(id: '', image: '', name: '');

  /// Convert Model to Json structure so that you can store data
  toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'ProductCount': productCount,
      'IsFeatured': isFeatured,
    };
  }

  /// Map Json oriented document snapshot from firebase to UserModel
  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return BrandModel.empty();
    return BrandModel(
      id: data['Id'] ?? '',
      name: data['Name'] ?? '',
      image: data['Image'] ?? '',
      productCount: data['ProductCount'] ?? 0,
      isFeatured: data['IsFeatured'] ?? false,
    );
  }

}
