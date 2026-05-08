class DepartmentModel {
  final String stateCode;
  final String stateName;

  const DepartmentModel({required this.stateCode, required this.stateName});

  factory DepartmentModel.fromJson(Map<String, dynamic> json) {
    return DepartmentModel(
      stateCode: json['DepartmentId'] ?? '',
      stateName: json['DepartmentName'] ?? '',
    );
  }
}
