class KeteranganModel {
  final int? id;
  final String? keterangan;

  KeteranganModel({this.id, this.keterangan});

  factory KeteranganModel.fromJson(Map<String, dynamic> json) {
    return KeteranganModel(
      id: json['id'],
      keterangan: json['keterangan'],
    );
  }
}