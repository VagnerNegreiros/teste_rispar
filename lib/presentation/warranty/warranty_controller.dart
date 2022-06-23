import 'package:get/get.dart';
import 'package:teste_rispar/data/model/simulation_model.dart';
import 'package:teste_rispar/routes/app_routues.dart';

class WarrantyController extends GetxController {
  SimulationModel simulationArguments = Get.arguments[0];
  final String amountValueString = Get.arguments[1];

  final RxDouble ratingTerm = 9.0.obs;
  final RxDouble ratingLTV = 35.0.obs;

  onChangedPortionSlider(newRating) {
    ratingTerm.value = newRating;
  }

  onChangedWarrantySlider(newRating) {
    ratingLTV.value = newRating;
  }

  void sendData(bool warranty) {
    SimulationModel simulation = SimulationModel(
      fullName: simulationArguments.fullName,
      email: simulationArguments.email,
      amount: simulationArguments.amount,
      term: ratingTerm.value.toInt(),
      ltv: ratingLTV.value.toInt(),
      hasProtectedCollateral: warranty,
    );
    Get.toNamed(AppRoutes.result, arguments: simulation);
  }
}
