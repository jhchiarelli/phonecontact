import 'package:get/get.dart';
import './src/core/services/hasura/hasura_service.dart';

class MainBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HasuraService());
  }
}
