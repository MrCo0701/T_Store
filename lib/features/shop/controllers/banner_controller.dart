import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/data/repositories/banners/banner_repository.dart';
import 'package:t_store/features/shop/models/banner_model.dart';
import 'package:t_store/utils/popups/loaders.dart';

class BannerController extends GetxController {

  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  // * Update page navigation Dots
  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  // * Fetch Banners
  Future<void> fetchBanners() async {
    try {
      isLoading.value = true;
      final bannerRepo = Get.put(BannerRepository());

      final banners = await bannerRepo.fetchBanners();
      this.banners.assignAll(banners);

    }catch(e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }finally {
      isLoading.value = false;
    }
  }

}