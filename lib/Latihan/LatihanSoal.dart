// ignore: file_names
class LatihanSoal {
  final int? id;
  final int? id_kategori;
  final String? soal;
  final String? pertanyaan;
  final String? jawaban_a;
  final String? jawaban_b;
  final String? jawaban_c;
  final String? jawaban_d;
  final int? benar_a;
  final int? benar_b;
  final int? benar_c;
  final int? benar_d;

  LatihanSoal({
    this.id,
    this.id_kategori,
    this.soal,
    this.pertanyaan,
    this.jawaban_a,
    this.jawaban_b,
    this.jawaban_c,
    this.jawaban_d,
    this.benar_a,
    this.benar_b,
    this.benar_c,
    this.benar_d,
  });

  factory LatihanSoal.fromJson(Map<String, dynamic> json) {
    return LatihanSoal(
      id: json['id'],
      id_kategori: json['id_kategori'],
      soal: json['soal'],
      pertanyaan: json['pertanyaan'],
      jawaban_a: json['jawaban_a'],
      jawaban_b: json['jawaban_b'],
      jawaban_c: json['jawaban_c'],
      jawaban_d: json['jawaban_d'],
      benar_a: json['benar_a'],
      benar_b: json['benar_b'],
      benar_c: json['benar_c'],
      benar_d: json['benar_d'],
    );
  }
}
