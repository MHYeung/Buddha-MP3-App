import 'dart:typed_data';
import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import '../../services/ad_manager.dart';

class PlayerController extends GetxController {
  late AudioPlayer _audioPlayer;
  late Uint8List audioBytes;
  late AdManagerInterstitialAd _interstitialAd;
  late BannerAd _bannerAd;
  String? audioAssets;
  int? index;
  String? downloadURL;
  late File? file;
  static const String fireBaseAddress = 'gs://buddha-mp3.appspot.com/';

  var isPlaying = false.obs;

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    _audioPlayer.stop();
    _isInAdLoaded = false;
    _interstitialAd.show();
    super.onClose();
  }

  @override
  void onInit() {
    _audioPlayer = AudioPlayer();
    index = Get.arguments as int;
    //debugPrint(audioAssets);
    fetchAndPlaySong();
    _initInterAd();
    _initBannerAd();
    super.onInit();
  }

  //If cannot find local then download from cloud storage
  Future<void> fetchAndPlaySong() async {
    final directory = await getApplicationDocumentsDirectory();
    file = File('${directory.path}/song${index! + 1}.mp3');
    if (file!.existsSync()) {
      //await file!.writeAsBytes(bytes.buffer.asUint8List());
      // audioBytes =
      //     bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
      await _audioPlayer.play(file!.path, isLocal: true);
      //print('Play From Local');
    } else {
      Get.showSnackbar(const GetSnackBar(
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.TOP,
        borderRadius: 15,
        title: '加載中',
        message: '請稍侯',
      ));
      downloadURL = await firebase_storage.FirebaseStorage.instance
          .ref()
          .child('song${index! + 1}.mp3')
          .getDownloadURL();
      //print(downloadURL);
      File downloadToFile = File('${directory.path}/song${index! + 1}.mp3');
      try {
        await firebase_storage.FirebaseStorage.instance
            .ref('song${index! + 1}.mp3')
            .writeToFile(downloadToFile);
        Get.showSnackbar(GetSnackBar(
          borderRadius: 15,
          snackStyle: SnackStyle.FLOATING,
          snackPosition: SnackPosition.TOP,
          title: '下載中',
          message: '位置在 : ${downloadToFile.path}',
        ));
      } catch (e) {
        // e.g, e.code == 'canceled'
      }
      await _audioPlayer.play(downloadURL!);
    }
    isPlaying.value = true;
  }

  Future<void> playOrPauseSong() async {
    if (isPlaying.value) {
      await _audioPlayer.pause();
      isPlaying.value = false;
    } else {
      await _audioPlayer.resume();
      isPlaying.value = true;
    }
    update();
  }

  //admob
  bool _isInAdLoaded = false;

  var isBanAdLoaded = false.obs;

  BannerAd get bannerAd => _bannerAd;

  void _initBannerAd() {
    _bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: AdManager.bannerAdUnitID,
        request: const AdRequest(),
        listener: BannerAdListener(
            onAdLoaded: (ad) {
              isBanAdLoaded.value = true;
            },
            onAdFailedToLoad: (ad, error) {}));
    _bannerAd.load();
  }

  void _initInterAd() {
    AdManagerInterstitialAd.load(
        adUnitId: AdManager.interstitialAdUnitID,
        request: const AdManagerAdRequest(),
        adLoadCallback: AdManagerInterstitialAdLoadCallback(
            onAdLoaded: onAdLoaded, onAdFailedToLoad: (error) {}));
  }

  void onAdLoaded(AdManagerInterstitialAd ad) {
    _interstitialAd = ad;
    _isInAdLoaded = true;

    _interstitialAd.fullScreenContentCallback =
        FullScreenContentCallback(onAdDismissedFullScreenContent: (ad) {
      _interstitialAd.dispose();
    }, onAdFailedToShowFullScreenContent: (ad, error) {
      _initInterAd();
    });
  }
}
