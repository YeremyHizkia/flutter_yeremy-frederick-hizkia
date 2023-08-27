Future<List<int>> Perkalian(List<int> data, int kali) async {
  List<int> hasil = [];

  await Future.forEach(data, (int daftarList) async {
    int hasilKali = daftarList * kali;
    hasil.add(hasilKali);
  });

  return hasil;
}

void main() async {
  List<int> dataList = [4, 2, 6, 7, 3];
  int nilaiKali = 5;

  List<int> hasilAkhir = await Perkalian(dataList, nilaiKali);
  print("Hasil Perkaliannya:  $hasilAkhir");
}
