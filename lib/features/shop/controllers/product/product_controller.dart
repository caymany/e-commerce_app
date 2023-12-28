import 'package:devhub_kenya/data/repositories/products/product_repository.dart';
import 'package:devhub_kenya/features/shop/models/product_model.dart';
import 'package:devhub_kenya/utils/constants/enums.dart';
import 'package:devhub_kenya/utils/popups/loaders.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      // Show Loader while loading Products
      isLoading.value = true;

      // Fetch Products
      final products = await productRepository.getFeaturedProducts();

      // Assign Products
      featuredProducts.assignAll(products);

    } catch (e) {
      DLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {

      // Fetch Products
      final products = await productRepository.getFeaturedProducts();
      return products;

    } catch (e) {
      DLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      return [];
    }
  }

  /// Get Product Price or Price range for variations
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    // If no variations exist, return simple price or sale price
    if(product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price).toString();
    } else {
      // Calculate the smallest and largest prices from the varieties
      for (var variation in product.productVariations!){
        // Determine the price to consider (Sale price or regular)
        double priceToConsider = variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        // Update Smallest and Largest Prices
        if(priceToConsider < smallestPrice){
          smallestPrice = priceToConsider;
        }

        if(priceToConsider > largestPrice){
          largestPrice = priceToConsider;
        }
      }
      // If smallest Price and Largest Price are same
      if(smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else {
        // Otherwise return the price range
        return ' $smallestPrice - Ksh $largestPrice';
      }
    }
  }

  /// Calculate Discount Percentage
  String? calculateSalePercentage(double originalPrice, double? salePrice){
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  /// Check Product Stock Status
  String getProductStockStatus (int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}
