import 'package:get/get.dart';
import 'package:teste_rispar/presentation/home/home_binding.dart';
import 'package:teste_rispar/presentation/home/home_screen.dart';
import 'package:teste_rispar/presentation/value/amount_binding.dart';
import 'package:teste_rispar/presentation/value/amount_screen.dart';
import 'package:teste_rispar/routes/app_routues.dart';


class AppScreens{
  static final routes = [
    GetPage(name: AppRoutes.home, page: () => const HomeScreen(),binding: HomeBinding()),
    GetPage(name: AppRoutes.amount, page: () => const AmountScreen(),binding: AmountBinding()),
  ];
}