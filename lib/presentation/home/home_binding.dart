import 'package:get/get.dart';
import 'package:teste_rispar/presentation/home/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>HomeController());
  }
}