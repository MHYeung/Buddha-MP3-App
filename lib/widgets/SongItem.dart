import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model/song.dart';
import '../routes/app_pages.dart';

class SongItem extends StatelessWidget {
  SongItem({Key? key, required this.id}) : super(key: key);

  final String id;

  final songs = Songs.songList;

  @override
  Widget build(BuildContext context) {
    final index = songs.indexWhere((element) => element.id == id);
    return ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: GridTile(
          footer: GridTileBar(
            //leading: CircleAvatar(child: Text(song.id),),
            backgroundColor: Colors.black54,
            title: FittedBox(
                child: Text(
              songs[index].title,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
            //trailing: Text(songs[index].presenter, style: const TextStyle(fontSize: 12,color: Colors.white),),
          ),
          child: GestureDetector(
              onTap: () => Get.toNamed(Routes.AUDIO_PLAYER, arguments: index),
              child: Image.network(
                songs[index].coverImagePath,
                fit: BoxFit.cover,
              )),
        ));
  }
}
