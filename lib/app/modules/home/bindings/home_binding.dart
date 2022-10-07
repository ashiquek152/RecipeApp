import 'package:get/get.dart';
import 'package:smaple_recipe/app/modules/cartscreen/controllers/cartscreen_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<CartscreenController>(
      () => CartscreenController(),
    );
  }
}
