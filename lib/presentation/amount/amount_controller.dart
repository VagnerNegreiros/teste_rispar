import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:teste_rispar/common/constants/text_constant.dart';
import 'package:teste_rispar/data/models/simulation_model.dart';
import 'package:teste_rispar/routes/app_routues.dart';

class AmountController extends GetxController{

  SimulationModel simulationArguments = Get.arguments;
  final RxBool validate = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final MaskedTextController amountController = MaskedTextController(mask: '000.000,00');
  bool isFirst = true;

  String? validateAmount(String value) {
    double amount = convertAmountStringToDouble(value);

    if(amount > 300000){
      return TextConstant.amountPositiveInvalid;
    } else if(amount < 500){
      return TextConstant.amountNegativeInvalid;
    }else {
      return null;
    }
  }

  String? onChanged(String? value){
    if(amountController.value.text != ""){
      validate.value = true;
    }else {
      validate.value = false;
    }

    return null;
  }

  double convertAmountStringToDouble(String value){
    String amountString = value.replaceAll('.','');
    return double.parse(amountString.replaceAll(',','.'));
  }

  void sendForm() {
    if (formKey.currentState!.validate()) {
      double amount = convertAmountStringToDouble(amountController.value.text);
      SimulationModel simulation = SimulationModel(
        name: simulationArguments.name,
        email: simulationArguments.email,
        amount: amount,
      );
      Get.toNamed(AppRoutes.warranty,arguments: simulation);
    }
  }



}