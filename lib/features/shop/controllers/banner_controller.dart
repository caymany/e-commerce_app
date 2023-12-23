import 'package:devhub_kenya/data/repositories/banners/banner_repository.dart';
import 'package:devhub_kenya/features/shop/models/banner_model.dart';
import 'package:devhub_kenya/utils/popups/loaders.dart';
import 'package:get/get.dart';


class BannerController extends GetxController {

  /// Variables
  final isLoading = false.obs;
  final carouselCurrentIndex = 0.obs;
  final RxList<BannerModel> banners =<BannerModel>[].obs;

/// First Time override
  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  void updatePageIndicator(index){
    carouselCurrentIndex.value = index;
  }
  /// fetch banners
  Future<void> fetchBanners() async {
    try{
      // Show Loader while loading categories
      isLoading.value = true;

      // Fetch banner from data source
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      // Assign Banners
      this.banners.assignAll(banners);

    } catch (e) {
      DLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }
}
