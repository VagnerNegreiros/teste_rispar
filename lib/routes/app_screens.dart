import 'package:get/get.dart';
import 'package:teste_rispar/presentation/home_screen.dart';
import 'package:teste_rispar/routes/app_routues.dart';


class AppScreens{
  static final routes = [
    GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
  ];
}