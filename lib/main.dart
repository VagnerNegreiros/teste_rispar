import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:teste_rispar/routes/app_routues.dart';
import 'package:teste_rispar/routes/app_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return GetMaterialApp(
      title: 'Teste Rispar',
      getPages: AppScreens.routes,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
    );
  }
}