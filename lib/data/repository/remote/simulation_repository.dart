import 'package:http/http.dart';
import 'package:teste_rispar/data/service/simulation_service.dart';

class SimulationRepository {
  final SimulationService api;

  SimulationRepository(this.api);

  Future<Response> postSimulation(Map data) async {
    return await api.postSimulation(data);
  }
}
