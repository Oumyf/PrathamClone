class MunicipalityModel {
  final String municipalityId;
  final String municipalityName;

  const MunicipalityModel({
    required this.municipalityId,
    required this.municipalityName,
  });

  factory MunicipalityModel.fromJson(Map<String, dynamic> json) {
    return MunicipalityModel(
      municipalityId: json['municipalityId'] ?? '',
      municipalityName: json['municipalityName'] ?? '',
    );
  }
}
