import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../Model/song.dart';
import '../../services/ad_manager.dart';

class CategoryController extends GetxController{
  Songs s = Songs();
  late BannerAd _bannerAd;
  var isLoading = false.obs;
  var isBanAdLoaded =false.obs;

  BannerAd get bannerAd => _bannerAd;

  Rx<Song> suggestion = Song(coverImagePath: '', presenter: '', title: '', id: '', path: '').obs;

  Future<void> updateSuggestion() async{
    isLoading.value  = true;
    suggestion.value = s.randomSuggestion();
    update();
    isLoading.value = false;
  }

  @override
  void onInit() {
    updateSuggestion();
    _initBannerAd();
    super.onInit();
  }

  void _initBannerAd() {
    _bannerAd = BannerAd(
        size: AdSize.fullBanner,
        adUnitId: AdManager.bannerAdUnitID,
        request: const AdRequest(),
        listener: BannerAdListener(
            onAdLoaded: (ad) {
              isBanAdLoaded.value = true;
            },
            onAdFailedToLoad: (ad, error) {}));
    _bannerAd.load();
  }

}