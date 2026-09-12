class PrakataModel {
  final int? id;
  final String? prakata;

  PrakataModel({this.id, this.prakata});

  factory PrakataModel.fromJson(Map<String, dynamic> json) {
    return PrakataModel(
      id: json['id'],
      prakata: json['prakata'],
    );
  }
}