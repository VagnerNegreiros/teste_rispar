import 'package:get/get.dart';
import 'package:teste_rispar/presentation/Warranty/warranty_controller.dart';

class WarrantyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WarrantyController());
  }
}
