import 'package:buddhamp3/screens/player/player_controller.dart';
import 'package:get/get.dart';

class PlayerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PlayerController());
  }

}