import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_rispar/common/constants/text_constant.dart';
import 'package:teste_rispar/data/model/simulation_model.dart';
import 'package:teste_rispar/routes/app_routues.dart';


class HomeController extends GetxController{

  final RxBool validate = false.obs;
  GlobalKey<FormState> formHomeKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  String? validateName(String value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp =  RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return TextConstant.nameInvalid;
    }
    return null;
  }

  String? validateEmail(String value) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if(!regExp.hasMatch(value)){
      return TextConstant.emailInvalid;
    }else {
      return null;
    }
  }

  String? onChanged(String? value){
    if(nameController.value.text != "" && emailController.value.text != ""){
      validate.value = true;
    }else {
      validate.value = false;
    }
    return null;
  }

  void sendData() {
    if (formHomeKey.currentState!.validate()) {
      SimulationModel simulation = SimulationModel(
        name: nameController.value.text,
        email: emailController.value.text
      );
      Get.toNamed(AppRoutes.amount,arguments: simulation);
    }
  }

}