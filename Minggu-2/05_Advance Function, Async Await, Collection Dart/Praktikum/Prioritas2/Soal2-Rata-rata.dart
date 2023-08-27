void main() {
  List<int> data = [7, 5, 3, 5, 2, 1];
  int hasil = Hitung(data);
  print('Hasil: $hasil');
}

int Hitung(List<int> data) {
  int jumlah = data.reduce((value, element) => value + element);
  double rataRata = jumlah / data.length;
  int total = rataRata.ceil();
  return total;
}
