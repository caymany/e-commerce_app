class OrdersModel {
  String productId;
  String quantity;
  bool? isSelected;


  OrdersModel({
    required this.productId,
    required this.quantity,
    this.isSelected = true
  })
}