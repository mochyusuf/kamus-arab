// ignore: file_names
class LatihanKategori {
  final int? id;
  final String? nama;

  LatihanKategori({this.id, this.nama});

  factory LatihanKategori.fromJson(Map<String, dynamic> json) {
    return LatihanKategori(
      id: json['id'],
      nama: json['nama'],
    );
  }
}
