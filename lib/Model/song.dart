import 'dart:math';

import 'package:flutter/material.dart';

class Song {
  final String title;
  final String id;
  final String path;
  final String presenter;
  final String coverImagePath;

  Song(
      {required this.coverImagePath,
      required this.presenter,
      required this.title,
      required this.id,
      required this.path});
}

class Songs {
  static List<Song> songList = [
    Song(
      title: '爐香讚',
      path: 'assets/audio/song1.mp3',
      id: 's1',
      presenter: '悟禪法師',
      coverImagePath:
          'https://images.pexels.com/photos/15286/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
    ),
    Song(
      title: '戒定真香',
      path: 'assets/audio/song2.mp3',
      id: 's2',
      presenter: '悟禪法師',
      coverImagePath:
          'https://images.pexels.com/photos/624015/pexels-photo-624015.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
    ),
    Song(
      title: '寶鼎讚',
      path: 'assets/audio/song3.mp3',
      id: 's3',
      presenter: '悟禪法師',
      coverImagePath:
          'https://images.pexels.com/photos/3408744/pexels-photo-3408744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Song(
      title: '彌陀讚',
      path: 'assets/audio/song4.mp3',
      id: 's4',
      presenter: '悟禪法師',
      coverImagePath:
          'https://images.pexels.com/photos/3244513/pexels-photo-3244513.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Song(
      title: '藥師讚',
      path: 'assets/audio/song5.mp3',
      id: 's5',
      presenter: '悟禪法師',
      coverImagePath:
          'https://images.pexels.com/photos/1785493/pexels-photo-1785493.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Song(
      title: '讚禮西方',
      path: 'assets/audio/song6.mp3',
      id: 's6',
      presenter: '悟禪法師',
      coverImagePath:
          'https://images.pexels.com/photos/1509582/pexels-photo-1509582.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Song(
      title: '虔誠獻香花',
      path: 'assets/audio/song7.mp3',
      id: 's7',
      presenter: '悟禪法師',
      coverImagePath:
          'https://images.pexels.com/photos/4215113/pexels-photo-4215113.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Song(
      title: '佛面猶如淨滿月',
      path: 'assets/audio/song8.mp3',
      id: 's8',
      presenter: '悟禪法師',
      coverImagePath:
          'https://images.pexels.com/photos/1770809/pexels-photo-1770809.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Song(
      title: '準提咒',
      path: 'assets/audio/song9.mp3',
      id: 's9',
      presenter: '悟禪法師',
      coverImagePath:
          'https://images.pexels.com/photos/4318822/pexels-photo-4318822.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Song(
      title: '十方一切剎',
      path: 'assets/audio/song10.mp3',
      id: 's10',
      presenter: '悟禪法師',
      coverImagePath:
          'https://images.pexels.com/photos/3225517/pexels-photo-3225517.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Song(
      title: '普回向真言',
      path: 'assets/audio/song11.mp3',
      id: 's11',
      presenter: '悟禪法師',
      coverImagePath:
          'https://images.pexels.com/photos/3850526/pexels-photo-3850526.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Song(
      title: '三志心',
      path: 'assets/audio/song12.mp3',
      id: 's12',
      presenter: '悟禪法師',
      coverImagePath:
          'https://images.pexels.com/photos/3265460/pexels-photo-3265460.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Song(
      title: '娑婆界',
      path: 'assets/audio/song13.mp3',
      id: 's13',
      presenter: '悟禪法師',
      coverImagePath:
          'https://images.pexels.com/photos/2770933/pexels-photo-2770933.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Song(
      title: '觀世音讚',
      path: 'assets/audio/song14.mp3',
      id: 's14',
      presenter: '悟禪法師',
      coverImagePath:
          'https://images.pexels.com/photos/3900437/pexels-photo-3900437.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Song(
      title: '戒定香',
      path: 'assets/audio/song15.mp3',
      id: 's15',
      presenter: '悟禪法師',
      coverImagePath:
          'https://images.pexels.com/photos/3464632/pexels-photo-3464632.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Song(
      title: '香纔爇',
      path: 'assets/audio/song16.mp3',
      id: 's16',
      presenter: '悟禪法師',
      coverImagePath:
          'https://images.pexels.com/photos/3621344/pexels-photo-3621344.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Song(
      title: '彌陀讚鼓山韻',
      path: 'assets/audio/song17.mp3',
      id: 's17',
      presenter: '悟禪法師',
      coverImagePath:
          'https://cdn.pixabay.com/photo/2016/12/23/16/49/feng-shui-1927590__340.jpg',
    ),
    Song(
      title: '阿彌陀佛身金色新版',
      path: 'assets/audio/song18.mp3',
      id: 's18',
      presenter: '悟禪法師',
      coverImagePath:
          'https://images.unsplash.com/photo-1539680964273-ae13f8a44e22?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8M3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
    ),
    Song(
      title: '拜願',
      path: 'assets/audio/song19.mp3',
      id: 's19',
      presenter: '悟禪法師',
      coverImagePath:
          'https://cdn.pixabay.com/photo/2014/10/04/05/05/dhammakaya-pagoda-472496__340.jpg',
    ),
    Song(
      title: '六字佛號',
      path: 'assets/audio/song20.mp3',
      id: 's20',
      presenter: '悟禪法師',
      coverImagePath:
          'https://cdn.pixabay.com/photo/2021/07/15/21/38/buddhist-temple-6469455__340.jpg',
    ),
    Song(
      title: '南無消災延壽藥師佛',
      path: 'assets/audio/song21.mp3',
      id: 's21',
      presenter: '悟禪法師',
      coverImagePath:
          'https://cdn.pixabay.com/photo/2020/10/09/21/03/buddha-5641534__340.jpg',
    ),
    Song(
      title: '娑婆界',
      path: 'assets/audio/song22.mp3',
      id: 's22',
      presenter: '悟禪法師',
      coverImagePath:
          'https://cdn.pixabay.com/photo/2020/04/23/14/00/buddha-5082641__340.jpg',
    ),
    Song(
      title: '尊勝咒',
      path: 'assets/audio/song23.mp3',
      id: 's23',
      presenter: '悟禪法師',
      coverImagePath:
          'https://cdn.pixabay.com/photo/2020/10/01/17/11/temple-5619197__340.jpg',
    ),
    Song(
      title: '鐘聲偈',
      path: 'assets/audio/song24.mp3',
      id: 's24',
      presenter: '悟禪法師',
      coverImagePath:
          'https://cdn.pixabay.com/photo/2020/10/29/05/02/buddhist-5695220__340.jpg',
    ),
    Song(
      title: '百字咒',
      path: 'assets/audio/song25.mp3',
      id: 's25',
      presenter: '悟禪法師',
      coverImagePath:
          'https://cdn.pixabay.com/photo/2018/01/19/11/13/abstract-3092201__340.jpg',
    ),
    Song(
      title: '降伏魔力冤',
      path: 'assets/audio/song26.mp3',
      id: 's26',
      presenter: '悟禪法師',
      coverImagePath:
          'https://cdn.pixabay.com/photo/2014/12/03/12/21/monk-555391__340.jpg',
    ),
    Song(
      title: '開經偈',
      path: 'assets/audio/song27.mp3',
      id: 's27',
      presenter: '悟禪法師',
      coverImagePath:
          'https://cdn.pixabay.com/photo/2018/02/15/10/14/sky-3154857__340.jpg',
    ),
    Song(
      title: '苦海無邊',
      path: 'assets/audio/song28.mp3',
      id: 's28',
      presenter: '悟禪法師',
      coverImagePath: 'https://images.unsplash.com/photo-1507868162883-6b769c1a88c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dGVtcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    ),
    Song(
      title: '香花燈塗果',
      path: 'assets/audio/song29.mp3',
      id: 's29',
      presenter: '悟禪法師',
      coverImagePath: 'https://images.unsplash.com/photo-1554554497-0095c34db3ec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8dGVtcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    ),
    Song(
      title: '普賢十大願王',
      path: 'assets/audio/song30.mp3',
      id: 's30',
      presenter: '悟禪法師',
      coverImagePath: 'https://images.unsplash.com/photo-1544186673-c4881521545f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHRlbXBsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    ),
    Song(
      title: '尊勝咒慢板',
      path: 'assets/audio/song31.mp3',
      id: 's31',
      presenter: '悟禪法師',
      coverImagePath: 'https://images.unsplash.com/photo-1510428571240-8a7a15ade3f6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fHRlbXBsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    ),
    Song(
      title: '南柯夢 夢南柯',
      path: 'assets/audio/song32.mp3',
      id: 's32',
      presenter: '悟禪法師',
      coverImagePath: 'https://images.unsplash.com/photo-1505079403222-b5bbf1484f19?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Nnx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
    ),
    Song(
      title: '香焚東海',
      path: 'assets/audio/song33.mp3',
      id: 's33',
      presenter: '悟禪法師',
      coverImagePath: 'https://images.unsplash.com/photo-1513415564515-763d91423bdd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTh8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    ),
    Song(
        coverImagePath: 'https://cdn.pixabay.com/photo/2018/11/17/06/55/buddha-3820620__340.jpg',
        presenter: '悟禪法師',
        title: '南無寶檀華菩薩摩訶薩',
        id: 's34',
        path: 'assets/audio/song34.mp3'),
    Song(
      title: '戒定真香讚',
      id: 's35',
      presenter: '戒德老和尚',
      path: 'assets/audio/song35.mp3',
      coverImagePath: 'https://images.pexels.com/photos/167699/pexels-photo-167699.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Song(
      title: '天寧寺 爐香讚',
      id: 's36',
      presenter: '戒德老和尚',
      path: 'assets/audio/song36.mp3',
      coverImagePath: 'https://images.pexels.com/photos/1834399/pexels-photo-1834399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Song(
      title: '虔誠獻香花',
      id: 's37',
      presenter: '戒德老和尚',
      path: 'assets/audio/song37.mp3',
      coverImagePath: 'https://images.pexels.com/photos/131723/pexels-photo-131723.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Song(
      title: '準提咒-天寧寺',
      id: 's38',
      presenter: '戒德老和尚',
      path: 'assets/audio/song38.mp3',
      coverImagePath: 'https://images.pexels.com/photos/1563604/pexels-photo-1563604.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Song(
      title: '阿穆伽 祝延讚',
      id: 's39',
      presenter: '戒德老和尚',
      path: 'assets/audio/song39.mp3',
      coverImagePath: 'https://images.pexels.com/photos/1459534/pexels-photo-1459534.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Song(
      title: '阿穆伽 咒語',
      id: 's40',
      presenter: '戒德老和尚',
      path: 'assets/audio/song40.mp3',
      coverImagePath: 'https://images.pexels.com/photos/1008739/pexels-photo-1008739.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Song(
      title: '香花燈塗果樂',
      id: 's41',
      presenter: '戒德老和尚',
      path: 'assets/audio/song41.mp3',
      coverImagePath: 'https://images.unsplash.com/photo-1599719794412-0c646b0bf2f3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fHRlbXBsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    ),
    Song(
      title: '佛緣情深',
      id: 's42',
      presenter: '佛教歌曲',
      path: 'assets/audio/song42.mp3',
      coverImagePath: 'https://images.pexels.com/photos/1808329/pexels-photo-1808329.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Song(
      title: '清淨法身佛',
      id: 's43',
      presenter: '佛教歌曲',
      path: 'assets/audio/song43.mp3',
      coverImagePath: 'https://images.pexels.com/photos/1612462/pexels-photo-1612462.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Song(
      title: '法緣',
      id: 's44',
      presenter: '佛教歌曲',
      path: 'assets/audio/song44.mp3',
      coverImagePath: 'https://images.pexels.com/photos/756861/pexels-photo-756861.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Song(
      title: '佛心永恆',
      id: 's45',
      presenter: '佛教歌曲',
      path: 'assets/audio/song45.mp3',
      coverImagePath: 'https://images.pexels.com/photos/315938/pexels-photo-315938.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Song(
      title: '阿彌陀佛謝謝您',
      id: 's46',
      presenter: '佛教歌曲',
      path: 'assets/audio/song46.mp3',
      coverImagePath: 'https://images.pexels.com/photos/38537/woodland-road-falling-leaf-natural-38537.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Song(
      title: ' 阿彌陀佛在心間',
      id: 's47',
      presenter: '佛教歌曲',
      path: 'assets/audio/song47.mp3',
      coverImagePath: 'https://images.pexels.com/photos/1955134/pexels-photo-1955134.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Song(
      title: '佛陀牽著我的手',
      id: 's48',
      presenter: '佛教歌曲',
      path: 'assets/audio/song48.mp3',
      coverImagePath: 'https://images.pexels.com/photos/2360684/pexels-photo-2360684.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Song(
      title: '誓願癡心不變',
      id: 's49',
      presenter: '佛教歌曲',
      path: 'assets/audio/song49.mp3',
      coverImagePath: 'https://images.pexels.com/photos/2565222/pexels-photo-2565222.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Song(
      title: '梵音 藥師灌頂真言21遍',
      id: 's50',
      presenter: '佛教歌曲',
      path: 'assets/audio/song50.mp3',
      coverImagePath: 'https://images.pexels.com/photos/827518/pexels-photo-827518.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Song(
      title: '療痔病咒49遍',
      id: 's51',
      presenter: '佛教歌曲',
      path: 'assets/audio/song51.mp3',
      coverImagePath: 'https://images.pexels.com/photos/4099106/pexels-photo-4099106.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Song(
      title: '佛說療痔病經',
      id: 's52',
      presenter: '佛號 佛經 咒語',
      path: 'assets/audio/song52.mp3',
      coverImagePath: 'https://images.pexels.com/photos/334978/pexels-photo-334978.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Song(
      title: '楞嚴咒',
      id: 's53',
      presenter: '佛號 佛經 咒語',
      path: 'assets/audio/song53.mp3',
      coverImagePath: 'https://images.pexels.com/photos/1478524/pexels-photo-1478524.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Song(
      title: '般若波羅蜜多心經',
      id: 's54',
      presenter: '佛號 佛經 咒語',
      path: 'assets/audio/song54.mp3',
      coverImagePath: 'https://images.pexels.com/photos/3889928/pexels-photo-3889928.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Song(
      title: '瑜伽燄口-尊勝咒',
      id: 's55',
      presenter: '佛號 佛經 咒語',
      path: 'assets/audio/song55.mp3',
      coverImagePath: 'https://images.pexels.com/photos/2531709/pexels-photo-2531709.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Song(
      title: '思鄉佛號',
      id: 's56',
      presenter: '佛號 佛經 咒語',
      path: 'assets/audio/song56.mp3',
      coverImagePath: 'https://images.pexels.com/photos/2114014/pexels-photo-2114014.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Song(
      title: '六字大明咒',
      id: 's57',
      presenter: '佛號 佛經 咒語',
      path: 'assets/audio/song57.mp3',
      coverImagePath: 'https://images.pexels.com/photos/3793306/pexels-photo-3793306.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Song(
      title: '慧律法師梵音大悲咒',
      id: 's58',
      presenter: '佛號 佛經 咒語',
      path: 'assets/audio/song58.mp3',
      coverImagePath: 'https://images.pexels.com/photos/844297/pexels-photo-844297.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Song(
      title: '彌陀大咒',
      id: 's59',
      presenter: '佛號 佛經 咒語',
      path: 'assets/audio/song59.mp3',
      coverImagePath: 'https://images.pexels.com/photos/6348820/pexels-photo-6348820.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Song(
      title: '妙蓮老和尚-六度觀音',
      id: 's60',
      presenter: '佛號 佛經 咒語',
      path: 'assets/audio/song60.mp3',
      coverImagePath: 'https://images.pexels.com/photos/5245865/pexels-photo-5245865.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),

  ];

  List<Song> listByPresenter(String presenter) {
    final p = songList.where((element) => element.presenter == presenter).toList();
    return p;
  }

  String presenterImageUrl(String presenter) {
    switch (presenter) {
      case '悟禪法師':
        return 'https://9.share.photo.xuite.net/a49b4c25/19bd857/11515483/540441596_m.jpg';
      case '戒德老和尚':
        return 'http://www.muni-buddha.com.tw/mp3/%E6%88%92%E5%BE%B7%E8%80%81%E5%92%8C%E5%B0%9A.jpg';
      case '佛教歌曲':
        return 'https://i2.kknews.cc/5c9NsEkqXJSFTYhhIYok64aFsmQp49gbYg/0.jpg';
      case '佛號 佛經 咒語':
        return 'http://www.buddhism.org.hk/upjpeg/images/2015/12/12/20151212060950958001.jpg';
      default:
        return '';
    }
  }

  Song randomSuggestion() {
    final random = Random();
    int i = random.nextInt(songList.length);
    return songList[i];
  }

  List<String> presenterList() {
    final list = songList.map((e) => e.presenter).toList().toSet().toList();
    return list;
  }
}
