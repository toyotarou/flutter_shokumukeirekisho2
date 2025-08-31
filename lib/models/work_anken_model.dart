class WorkAnkenModel {
  WorkAnkenModel({
    required this.year,
    required this.month,
    this.contractId,
    required this.name,
    this.kibo,
    this.koutei,
    this.os,
    this.gengo,
    this.db,
    this.tool,
  });

  /// JSON → モデル
  factory WorkAnkenModel.fromJson(Map<String, dynamic> json) {
    return WorkAnkenModel(
      year: json['year'] as String,
      month: json['month'] as String,
      contractId: json['contract_id'] != null ? json['contract_id'] as int : null,
      name: json['name'] as String,
      kibo: json['kibo'] as String?,
      koutei: json['koutei'] as String?,
      os: json['os'] as String?,
      gengo: json['gengo'] as String?,
      db: json['db'] as String?,
      tool: json['tool'] as String?,
    );
  }

  final String year;
  final String month;
  final int? contractId;
  final String name;
  final String? kibo;
  final String? koutei;
  final String? os;
  final String? gengo;
  final String? db;
  final String? tool;

  /// モデル → JSON
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'year': year,
      'month': month,
      'contract_id': contractId,
      'name': name,
      'kibo': kibo,
      'koutei': koutei,
      'os': os,
      'gengo': gengo,
      'db': db,
      'tool': tool,
    };
  }
}
