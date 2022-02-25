import 'package:buddhamp3/screens/category_screen/category_controller.dart';
import 'package:get/get.dart';

class CategoryBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryController());
  }

}