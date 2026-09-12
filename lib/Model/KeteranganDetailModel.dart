class KeteranganDetailModel {
  final int? id;
  final String? urutan;
  final String? judul;
  final int? id_judul;
  final String? isi;
  final int? id_isi;

  KeteranganDetailModel({
    this.id, 
    this.urutan,
    this.judul,
    this.id_judul,
    this.isi,
    this.id_isi,
    });

  factory KeteranganDetailModel.fromJson(Map<String, dynamic> json) {
    return KeteranganDetailModel(
      id: json['id'],
      urutan: json['urutan'],
      judul: json['judul'],
      id_judul: json['id_judul'],
      isi: json['isi'],
      id_isi: json['id_isi'],
    );
  }
}