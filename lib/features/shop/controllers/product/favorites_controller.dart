import 'dart:convert';

import 'package:devhub_kenya/data/repositories/products/product_repository.dart';
import 'package:devhub_kenya/features/shop/models/product_model.dart';
import 'package:devhub_kenya/utils/local_storage/storage_utility.dart';
import 'package:devhub_kenya/utils/popups/loaders.dart';
import 'package:get/get.dart';

class FavouritesController extends GetxController {
  static FavouritesController get instance => Get.find();

  /// Variables
  final favorites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavorites();
  }

  // Method to initialize the
  void initFavorites() {
    final json = DLocalStorage.instance().readData('favorites');
    if (json!=null){
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(storedFavourites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavorite(String productId) {
    return favorites[productId] ?? false;
  }

  // Add Products
  void toggleFavoriteProduct(String productId) {
    if(!favorites.containsKey(productId)) {
      favorites[productId] = true;
      saveFavoritesToStorage();
      DLoaders.customToast(message: 'Product has been added to your Wishlist');
    } else{
      DLocalStorage.instance().removeData(productId);
      favorites.remove(productId);
      saveFavoritesToStorage();
      favorites.refresh();
      DLoaders.customToast(message: 'Product has been removed to your Wishlist');
    }
  }
  void saveFavoritesToStorage() {
    final encodedFavorites = json.encode(favorites);
    DLocalStorage.instance().saveDate('favorites', encodedFavorites);
  }

  Future<List<ProductModel>> favoriteProducts() async {
    return await ProductRepository.instance.getFavouriteProducts(favorites.keys.toList());
  }
}