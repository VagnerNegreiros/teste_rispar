import 'package:get/get.dart';
import 'package:teste_rispar/data/model/simulation_model.dart';
import 'package:teste_rispar/data/repository/remote/simulation_repository.dart';
import 'package:teste_rispar/data/service/simulation_service.dart';
import 'package:teste_rispar/routes/app_routues.dart';


class ResultController extends GetxController{

  SimulationModel simulationArguments = Get.arguments;

  final SimulationRepository simulationRepository = Get.put(SimulationRepository(SimulationService()));
  RxBool loading = false.obs;
  RxBool visibilityDivider = false.obs;

  @override
  onReady(){
    sendData();
    super.onReady();
  }

  void toHome(){
    Get.offAllNamed(AppRoutes.home);
  }


  void sendData() {
    loading(true);
    var data = simulationRepository.postSimulation(
    {
      'fullname': 'teste',
      'email': 'email@email.com',
      'amount': 5000.0,
      'ltv': 20,
      'term': 6,
      'has_protected_collateral': true,
    }
    );

    // print(data);
    loading(false);
    visibilityDivider(true);

    // SimulationModel simulation = SimulationModel(
    //   name: simulationArguments.name,
    //   email: simulationArguments.email,
    //   amount: simulationArguments.amount,
    //   hasProtectedCollateral: simulationArguments.hasProtectedCollateral,
    // );
    // print(simulationArgumentstion);

  }

}