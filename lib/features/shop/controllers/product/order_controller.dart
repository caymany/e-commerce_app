import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devhub_kenya/features/shop/models/order_model.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController instance = Get.find();

  /// Variables
  final OrdersModel order;

}