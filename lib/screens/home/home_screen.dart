import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:launch_review/launch_review.dart';

import '../../Model/song.dart';
import '../../widgets/SongItem.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  String presenter = Get.arguments as String;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[400],
        appBar: AppBar(
          title: Text(
            '$presenter (${Songs().listByPresenter(presenter).length})',
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.brown[300],
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
        body: GridView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: Songs().listByPresenter(presenter).length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8),
            itemBuilder: (ctx, i) {
              return SongItem(id: Songs().listByPresenter(presenter)[i].id);
            }));
  }
}
