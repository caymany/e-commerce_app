import 'package:devhub_kenya/data/repositories/brands/brand_repository.dart';
import 'package:devhub_kenya/data/repositories/products/product_repository.dart';
import 'package:devhub_kenya/features/shop/models/brand_model.dart';
import 'package:devhub_kenya/features/shop/models/product_model.dart';
import 'package:devhub_kenya/utils/popups/loaders.dart';
import 'package:get/get.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  final isLoading = true.obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  /// -- Load Brands
  Future<void> getFeaturedBrands() async {
    try{
      // Show Loader while Loading Brands
      isLoading.value = true;
      final brands = await brandRepository.getAllBrands();

      allBrands.assignAll(brands);

      featuredBrands.assignAll(allBrands.where((brand) => brand.isFeatured ?? false).take(4));

    } catch (e) {
      DLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally{
      //Stop Loader
      isLoading.value = false;
    }
  }

  ///   Get Brands for categories
  Future<List<BrandModel>> getBrandForCategory(String categoryId) async {
    try {
      final brands = await brandRepository.getBrandsForCategory(categoryId);
      return brands;

    } catch (e) {
      DLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      return [];
    }
  }

  /// Get Brand Specific Products form data source
 Future<List<ProductModel>> getBrandProducts(String brandId) async {
    try{
      final products = await ProductRepository.instance.getProductsForBrand(brandId: brandId);
      return products;
    } catch (e) {
      DLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      return [];
    }
 }
}