import 'package:get/get.dart';
import 'package:teste_rispar/presentation/amount/amount_controller.dart';

class AmountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AmountController());
  }
}
