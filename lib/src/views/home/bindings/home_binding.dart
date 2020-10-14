
import 'package:get/get.dart';
import 'package:phonecontact/src/views/home/controller/home_controller.dart';
import 'package:phonecontact/src/views/home/repositories/home_hasura_repository.dart';
import 'package:phonecontact/src/views/home/repositories/home_repository_interface.dart';

class HomeBindig implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<IHomeRepository>(() => HomeHasuraRepository());
  }

}