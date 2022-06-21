import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_rispar/data/models/simulation_model.dart';


class WarrantyController extends GetxController{

  SimulationModel simulationArguments = Get.arguments;
  final RxBool validate = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();



}