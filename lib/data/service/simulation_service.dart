import 'package:get/get.dart';

class SimulationService extends GetConnect{

  Future<Response> postSimulation(Map data) => post('https://api.rispar.com.br/acquisition/simulation', data);


}