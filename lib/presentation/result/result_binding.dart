import 'package:get/get.dart';
import 'package:teste_rispar/presentation/result/result_controller.dart';

class ResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResultController());
  }
}
