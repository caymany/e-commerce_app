import 'package:devhub_kenya/features/shop/controllers/product/variation_controller.dart';
import 'package:devhub_kenya/features/shop/models/cart_item_model.dart';
import 'package:devhub_kenya/features/shop/models/product_model.dart';
import 'package:devhub_kenya/utils/constants/enums.dart';
import 'package:devhub_kenya/utils/local_storage/storage_utility.dart';
import 'package:devhub_kenya/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  // Variables
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = VariationController.instance;

  CartController() {
    loadCartItems();
  }

  // Add Items to cart
  void addToCart(ProductModel product) {
    // Quantity Check
    if (productQuantityInCart.value < 1) {
      DLoaders.customToast(message: 'Select Quantity');
      return;
    }

    if (product.productType == ProductType.variable.toString() &&
        variationController.selectedVariation.value.id.isEmpty) {
      DLoaders.customToast(message: 'Select Variation');
      return;
    }

    // Out of Stock Status
    if (product.productType == ProductType.variable.toString()) {
      if (variationController.selectedVariation.value.stock < 1) {
        DLoaders.warningSnackBar(
            message: 'Selected Variation is out of stock', title: 'Oh Snap!');
        return;
      }
    } else {
      if (product.stock < 1) {
        DLoaders.warningSnackBar(
            message: 'Selected product is out of stock', title: 'Oh Snap!');
        return;
      }
    }
    // Convert product model to cart model with quantity
    final selectedCartItem =
        convertToCartItem(product, productQuantityInCart.value);

    // Check if product is already added in cart
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == selectedCartItem.productId &&
        cartItem.variationId == selectedCartItem.variationId);

    if (index >= 0) {
      // Quantity already added or updated (cart -)
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }

    updateCart();
    DLoaders.customToast(message: 'Your product has been added to cart');
  }

  /// Function to covert product model into cart model
  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.toString()) {
      // Reset variation in case it is single
      variationController.resetSelectedAttributes();
    }
    final variation = variationController.selectedVariation.value;
    final isVariation = variation.id.isNotEmpty;
    final price = isVariation
        ? variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price
        : product.salePrice > 0.0
            ? product.salePrice
            : product.price;

    return CartItemModel(
      productId: product.id,
      title: product.title,
      price: price,
      quantity: quantity,
      variationId: variation.id,
      image: isVariation ? variation.image : product.thumbnail,
      brandName: product.brand != null ? product.brand!.name : '',
      selectedVariation: isVariation ? variation.attributeValues : null,
    );
  }

  /// Update Cart
  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotals() {
    double calculatedTotalPrice = 0.0;
    int calculatedNoOfItems = 0;

    for (var item in cartItems) {
      calculatedTotalPrice += (item.price) * item.quantity.toDouble();
      calculatedNoOfItems += item.quantity;
    }

    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems.value = calculatedNoOfItems;
  }

  void saveCartItems() {
    final cartItemStrings = cartItems.map((item) => item.toJson()).toList();
    DLocalStorage.instance().saveDate('cartItems', cartItemStrings);
  }

  void loadCartItems() {
    final cartItemStrings =
        DLocalStorage.instance().readData<List<dynamic>>('cartItems');
    if (cartItemStrings != null) {
      cartItems.assignAll(cartItemStrings
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
      updateCartTotals();
    }
  }

  // Get product Quantity in cart
  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  // Get variation Quantity in cart
  int getVariationQuantityInCart(String productId, String variationId) {
    final foundItem = cartItems.firstWhere(
        (item) => item.productId == productId && item.variationId == variationId,
        orElse: () => CartItemModel.empty()
    );
    return foundItem.quantity;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }
}
