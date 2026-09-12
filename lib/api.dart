class API {
  static String baseUrl = "https://kamus-arab.infinityfree.me/";

  String getBASEURL() {
    return baseUrl;
  }

  String getBASEURLLatihan() {
    return "${baseUrl}api/latihan";
  }

  String getBASEURLLatihanSoal(int id) {
    return "${baseUrl}api/latihan/${id}";
  }

  String getBASEURLKamus() {
    return "${baseUrl}api/kamus";
  }

  String getBASEURLKamusCari(String cari) {
    return "${baseUrl}api/kamus/${cari}";
  }

  String getBASEURLPrakata() {
    return "${baseUrl}api/prakata";
  }

  String getBASEURLKeterangan() {
    return "${baseUrl}api/keterangan";
  }

  String getBASEURLKeteranganDetail(String id) {
    return "${baseUrl}api/keterangan/${id}";
  }

  String getBASEURLKeteranganDetailUrutan(String id,String urutan) {
    return "${baseUrl}api/keterangan/${id}/${urutan}";
  }
}
