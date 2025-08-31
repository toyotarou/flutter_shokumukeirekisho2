class WorkTruthModel {
  WorkTruthModel({required this.year, required this.month, required this.name, this.contractId, required this.place});

  /// JSON → モデル
  factory WorkTruthModel.fromJson(Map<String, dynamic> json) {
    return WorkTruthModel(
      year: json['year'] as String,
      month: json['month'] as String,
      name: json['name'] as String,
      contractId: json['contract_id'] != null ? json['contract_id'] as int : null,
      place: json['place'] as String,
    );
  }

  final String year;
  final String month;
  final String name;
  final int? contractId; // null を許容
  final String place;

  /// モデル → JSON
  Map<String, dynamic> toJson() {
    return <String, dynamic>{'year': year, 'month': month, 'name': name, 'contract_id': contractId, 'place': place};
  }
}
