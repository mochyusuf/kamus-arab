import 'Latihan/LatihanSoal.dart';

class Singleton {
  static final Singleton _singleton = Singleton._internal();

  late List<LatihanSoal> listSoal;
  late int indexSoal;
  int skor = 0;

  late String cari;

  void setSkor(int data) {
    skor = data;
    print(skor);
  }

  void setindexSoal(int data) {
    indexSoal = data;
  }

  void setlistSoal(List<LatihanSoal> data) {
    listSoal = data;
  }

  void setCari(String data) {
    cari = data;
  }

  String getCari() {
    return cari;
  }

  int getindexSoal() {
    return indexSoal;
  }

  int getSkor() {
    return skor;
  }

  List<LatihanSoal> getlistSoal() {
    return listSoal;
  }

  factory Singleton() {
    return _singleton;
  }

  Singleton._internal();
}
