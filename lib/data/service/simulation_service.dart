import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:teste_rispar/common/constants/api_constant.dart';

class SimulationService {
  Future<http.Response> postSimulation(Map data) async {
    final response = await http.post(
      Uri.parse(ApiConstant.baseUrl + ApiConstant.acquisitionSimulation),
      body: json.encode(data),
    );

    return response;
  }
}
