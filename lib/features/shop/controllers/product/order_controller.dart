import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devhub_kenya/features/personalization/controllers/address_controller.dart';
import 'package:devhub_kenya/features/shop/controllers/product/cart_controller.dart';
import 'package:devhub_kenya/features/shop/controllers/product/checkout_controller.dart';
import 'package:devhub_kenya/features/shop/models/order_model.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController instance = Get.find();

  /// Variables
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());


  /// Fetch user's orders
  Future<List<OrderModel>> fetchUserOrders() async {
    try{
      final userOrders = await
    } catch (e) {}
  }


}