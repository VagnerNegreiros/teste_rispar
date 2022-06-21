import 'package:get/get.dart';
import 'package:teste_rispar/presentation/amount/amount_binding.dart';
import 'package:teste_rispar/presentation/amount/amount_screen.dart';
import 'package:teste_rispar/presentation/home/home_binding.dart';
import 'package:teste_rispar/presentation/home/home_screen.dart';
import 'package:teste_rispar/presentation/result/result_binding.dart';
import 'package:teste_rispar/presentation/result/result_screen.dart';
import 'package:teste_rispar/presentation/warranty/warranty_binding.dart';
import 'package:teste_rispar/presentation/warranty/warranty_screen.dart';
import 'package:teste_rispar/routes/app_routues.dart';


class AppScreens{
  static final routes = [
    GetPage(name: AppRoutes.home, page: () => const HomeScreen(),binding: HomeBinding()),
    GetPage(name: AppRoutes.amount, page: () => const AmountScreen(),binding: AmountBinding()),
    GetPage(name: AppRoutes.warranty, page: () => const WarrantyScreen(),binding: WarrantyBinding()),
    GetPage(name: AppRoutes.result, page: () => const ResultScreen(),binding: ResultBinding()),
  ];
}