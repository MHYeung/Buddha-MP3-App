import 'package:buddhamp3/routes/app_pages.dart';
import 'package:buddhamp3/screens/category_screen/category_controller.dart';
import 'package:buddhamp3/screens/player/player_screen.dart';
import 'package:buddhamp3/widgets/SongItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:launch_review/launch_review.dart';

import '../../Model/song.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);

  final logic = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[300],
        appBar: AppBar(
          title: const Text(
            '主頁',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.brown[400],
          actions: [
            TextButton.icon(
                onPressed: () {
                  LaunchReview.launch();
                },
                icon: const Icon(
                  Icons.share,
                  color: Colors.black,
                ),
                label: const Text('分享給朋友',
                    style: TextStyle(
                      color: Colors.black,
                    )))
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white24),
              child: Text(
                '曲目分類 (${Songs().presenterList().length})',
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                    children: Songs()
                        .presenterList()
                        .map((e) => GestureDetector(
                              onTap: () =>
                                  Get.toNamed(Routes.HOME, arguments: e),
                              child: Card(
                                elevation: 10,
                                shadowColor: Colors.black45,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: Container(
                                    width: 200,
                                    height: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                Songs().presenterImageUrl(e)
                                                //'http://www.muni-buddha.com.tw/mp3/%E6%88%92%E5%BE%B7%E8%80%81%E5%92%8C%E5%B0%9A.jpg'
                                                ))),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Colors.black26),
                                        child: Center(
                                            child: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Colors.black54),
                                          child: FittedBox(
                                            child: Text(
                                              e,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white70,
                                                  fontSize: 30),
                                            ),
                                          ),
                                        )))),
                              ),
                            ))
                        .toList()),
              ),
            ),
            const Divider(),
            Center(
              child: Obx(
                () => logic.isBanAdLoaded.value
                    ? SizedBox(
                        height: logic.bannerAd.size.height.toDouble(),
                        width: logic.bannerAd.size.width.toDouble(),
                        child: AdWidget(
                          ad: logic.bannerAd,
                        ),
                      )
                    : const SizedBox(),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white24),
              child: const Text(
                '推薦歌曲',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
            Expanded(
              child: Obx(
                () => GestureDetector(
                  onTap: () => Get.toNamed(Routes.AUDIO_PLAYER,
                      arguments: Songs.songList.indexWhere((element) =>
                          element.id == logic.suggestion.value.id)),
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(20, 5, 20, 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                logic.suggestion.value.coverImagePath))),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                              colors: [
                                Colors.white38,
                                Colors.black12,
                                Colors.black38,
                                Colors.black54,
                                Colors.black
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Center(
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.black54),
                                child: Text(logic.suggestion.value.title,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 30)),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.black54),
                              child: Text(logic.suggestion.value.presenter,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20)),
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
