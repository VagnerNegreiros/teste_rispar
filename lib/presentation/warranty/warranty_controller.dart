import 'package:get/get.dart';
import 'package:teste_rispar/data/model/simulation_model.dart';
import 'package:teste_rispar/routes/app_routues.dart';


class WarrantyController extends GetxController{

  SimulationModel simulationArguments = Get.arguments[0];
  final String amountValueString = Get.arguments[1];

  final RxDouble rating = 0.0.obs;
  onChangedSlider(newRating){
    rating.value = newRating;
  }

  void sendData(bool warranty) {
    SimulationModel simulation = SimulationModel(
      name: simulationArguments.name,
      email: simulationArguments.email,
      amount: simulationArguments.amount,
      hasProtectedCollateral: warranty,
    );
    print(simulation);
    Get.toNamed(AppRoutes.result);
  }

}