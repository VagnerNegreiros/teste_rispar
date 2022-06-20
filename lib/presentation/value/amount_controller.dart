import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_rispar/data/models/simulation_model.dart';

class AmountController extends GetxController{

  SimulationModel simulationArguments = Get.arguments;
  final RxBool validate = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController amountController = TextEditingController();


  void sendForm() {

    SimulationModel simulation = SimulationModel(
        // amount: double.parse(amountController.value.text)
      name: simulationArguments.name,
      email: simulationArguments.email,
      amount: 10.0,

    );
    print(simulation);
    if (formKey.currentState!.validate()) {
      SimulationModel simulation = SimulationModel(
          amount: double.parse(amountController.value.text)
      );
      // Get.toNamed(AppRoutes.amount,arguments: simulation);
      // print(nameController.value.text);
      // print(emailController.value.text);
    }
  }



}