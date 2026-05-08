import 'package:dio/dio.dart';
import 'package:pratham_clone/core/constants.dart';
import 'package:pratham_clone/data/models/department_model.dart';
import 'package:pratham_clone/data/models/municipality_model.dart';

class PullCrlService {
  final _dio = Dio();

  Future<List<DepartmentModel>> getDepartments() async {
    final response = await _dio.get(ApiConstants.getDepartments);
    final List data = response.data['data'];
    return data.map((e) => DepartmentModel.fromJson(e)).toList();
  }

  Future<List<MunicipalityModel>> getMunicipalities(String departmentId) async {
    final response = await _dio.get(
      ApiConstants.getMunicipalities,
      queryParameters: {'departmentId': departmentId},
    );
    final List data = response.data['data'];
    return data.map((e) => MunicipalityModel.fromJson(e)).toList();
  }

  Future<void> pullAllData({
    required List<MunicipalityModel> municipalities,
    required Function(String) onProgress,
    required Function(List) onCrlsReady,
    required Function(List, List, List) onFormsReady,
  }) async {
    onProgress('Téléchargement des outils ASER...');
    // final aserResponse = await _dio.get(ApiConstants.getAserSamples);
    // final List aserData = aserResponse.data['data'];

    onProgress('Téléchargement des comptes utilisateurs...');
    final crlResponse = await _dio.get(ApiConstants.getCrls);
    final List crlData = crlResponse.data['data'];
    onCrlsReady(crlData);

    for (final municipality in municipalities) {
      onProgress('Téléchargement des données de ${municipality.municipalityName}...');
      final formResponse = await _dio.get(
        ApiConstants.getForms,
        queryParameters: {'municipalityId': municipality.municipalityId},
      );
      final data = formResponse.data['data'];
      final institutes = data['instituteList'] ?? [];
      final schools = data['schoolList'] ?? [];
      final children = data['childSurvey'] ?? [];
      onFormsReady(institutes, schools, children);
    }
  }
}
