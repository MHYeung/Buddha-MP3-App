import 'package:buddhamp3/screens/category_screen/category_screen.dart';
import 'package:buddhamp3/screens/player/player_screen.dart';
import 'package:get/get.dart';
import '../screens/category_screen/category_binding.dart';
import '../screens/home/home_binding.dart';
import '../screens/home/home_screen.dart';
import '../screens/player/player_binding.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
        name: Routes.HOME, page: () => HomeScreen(), binding: HomeBinding()),
    GetPage(
        name: Routes.AUDIO_PLAYER,
        page: () => PlayerScreen(),
        binding: PlayerBinding()),
    GetPage(
        name: Routes.CATEGORY,
        page: () => CategoryScreen(),
        binding: CategoryBinding())
  ];
}
