import 'package:teste_rispar/data/service/simulation_service.dart';

class SimulationRepository{
  final SimulationService api;

  SimulationRepository(this.api);

  postSimulation(Map data){
    return api.postSimulation(data);
  }
}