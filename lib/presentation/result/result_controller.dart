import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:teste_rispar/common/constants/text_constant.dart';
import 'package:teste_rispar/data/model/simulation_model.dart';
import 'package:teste_rispar/data/model/simulation_response_model.dart';
import 'package:teste_rispar/data/repository/remote/simulation_repository.dart';
import 'package:teste_rispar/data/service/simulation_service.dart';
import 'package:teste_rispar/routes/app_routues.dart';

class ResultController extends GetxController {
  SimulationModel simulationArguments = Get.arguments;

  final SimulationRepository simulationRepository =
      Get.put(SimulationRepository(SimulationService()));
  RxBool loading = true.obs;
  RxBool error = false.obs;
  RxBool visibilityDivider = false.obs;
  RxBool noConnection = false.obs;
  SimulationResponseModel simulationResponseModel = SimulationResponseModel();

  final MoneyMaskedTextController amountTotalController =
      MoneyMaskedTextController(
    decimalSeparator: ',',
    thousandSeparator: '.',
    leftSymbol: TextConstant.symbolCifrao,
  );
  final MoneyMaskedTextController amountChoseController =
      MoneyMaskedTextController(
    decimalSeparator: ',',
    thousandSeparator: '.',
    leftSymbol: TextConstant.symbolCifrao,
  );
  final MoneyMaskedTextController amountBTCController =
      MoneyMaskedTextController(
    decimalSeparator: ',',
    thousandSeparator: '.',
    leftSymbol: TextConstant.symbolCifrao,
  );
  final MoneyMaskedTextController amountPlatformController =
      MoneyMaskedTextController(
    decimalSeparator: ',',
    thousandSeparator: '.',
    leftSymbol: TextConstant.symbolCifrao,
  );
  final MoneyMaskedTextController amountIOFController =
      MoneyMaskedTextController(
    decimalSeparator: ',',
    thousandSeparator: '.',
    leftSymbol: TextConstant.symbolCifrao,
  );

  @override
  onReady() {
    sendData();
    checkConnection();
    super.onReady();
  }

  checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    noConnection.value = !(connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile);

    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      noConnection.value = !(result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile);
    });

    noConnection.listen((bool value) {
      if (!value) {
        sendData();
      }
    });
  }

  void toHome() {
    Get.offAllNamed(AppRoutes.home);
  }

  void sendData() async {
    loading(true);

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile) {
      var response = await simulationRepository
          .postSimulation(simulationArguments.toJson());
      if (response.statusCode == 201) {
        loading(false);
        visibilityDivider(true);
        simulationResponseModel =
            SimulationResponseModel.fromJson(jsonDecode(response.body));

        amountChoseController.updateValue(simulationResponseModel.netValue!);
        amountBTCController
            .updateValue(simulationResponseModel.collateralUnitPrice!);
        amountTotalController
            .updateValue(simulationResponseModel.contractValue!);
        amountIOFController.updateValue(simulationResponseModel.iofFee!);
        amountPlatformController
            .updateValue(simulationResponseModel.originationFee!);
      } else {
        loading(true);
        error(true);
      }
    } else {
      loading(false);
      noConnection(true);
    }
  }
}
