import 'package:get/get.dart';

import 'package:my_new_try/app/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(),
    );
  }
}
