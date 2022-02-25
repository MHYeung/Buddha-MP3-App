import 'package:buddhamp3/Model/song.dart';
import 'package:buddhamp3/screens/player/player_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:launch_review/launch_review.dart';

class PlayerScreen extends StatelessWidget {
  PlayerScreen({Key? key}) : super(key: key);

  final player = Get.find<PlayerController>();
  final index = Get.arguments as int;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[400],
        appBar: AppBar(
            backgroundColor: Colors.brown[300],
            centerTitle: true,
            title: const Text(
          '播放中...', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
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
        ],),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(Songs.songList[index].coverImagePath), fit: BoxFit.cover)
          ),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white54
            ),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(15),
                        color: Colors.black54),
                    child: Text(Songs.songList[index].title,
                        style: const TextStyle(
                            fontSize: 60, fontWeight: FontWeight.bold)),
                  ),
                ),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(15),
                      color: Colors.black54),
                  child: Text(Songs.songList[index].presenter,  style: const TextStyle(
                      fontSize: 32, fontWeight: FontWeight.bold)),
                ),
                Center(
                  child: Obx(
                    () => TextButton.icon(
                      style: ButtonStyle(
                        shadowColor: MaterialStateProperty.all<Color>(Colors.black45),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(10)),
                        shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.transparent),
                      ),
                      icon: Icon(
                        player.isPlaying.value ? Icons.pause : Icons.play_arrow,
                        size: 80,
                        color: Colors.black,
                      ),
                      onPressed: player.playOrPauseSong,
                      label: Text(
                        player.isPlaying.value ? '暫停' : '播放',
                        style: const TextStyle(fontSize: 50, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            )),
          ),
        ),
        bottomNavigationBar: Obx(
          () => player.isBanAdLoaded.value
              ? SizedBox(
                  height: player.bannerAd.size.height.toDouble(),
                  width: player.bannerAd.size.width.toDouble(),
                  child: AdWidget(
                    ad: player.bannerAd,
                  ),
                )
              : const SizedBox(),
        ));
  }
}
