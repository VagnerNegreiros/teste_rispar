import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_rispar/data/models/simulation_model.dart';
import 'package:teste_rispar/routes/app_routues.dart';


class WarrantyController extends GetxController{

  SimulationModel simulationArguments = Get.arguments;
  final RxBool validate = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  void sendForm() {
    if (formKey.currentState!.validate()) {
      SimulationModel simulation = SimulationModel(
        name: simulationArguments.name,
        email: simulationArguments.email,
        amount: simulationArguments.amount,
      );
      // Get.toNamed(AppRoutes.warranty,arguments: simulation);
    }
  }

}