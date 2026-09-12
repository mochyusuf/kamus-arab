// ignore: file_names
class Kamus {
  final int? id;
  final int? id_kategori;
  final String? akar_kata;
  final String? arti;
  final String? kata;
  final String? kalimat;
  final bool? highlight;
  final String? non_kata;

  Kamus(
      {this.id,
      this.id_kategori,
      this.akar_kata,
      this.arti,
      this.kata,
      this.kalimat,
      this.highlight,
      this.non_kata});

  factory Kamus.fromJson(Map<String, dynamic> json) {
    return Kamus(
      id: json['id'],
      id_kategori: json['id_kategori'],
      akar_kata: json['akar_kata'],
      arti: json['arti'],
      kata: json['kata'],
      kalimat: json['kalimat'],
      highlight: json['highlight'],
      non_kata: json['non_kata'],
    );
  }
}
