Future<int> Hitung(int n) async {
  if (n == 0 || n == 1) {
    return 1;
  } else {
    int faktorial = 1;
    for (int i = 2; i <= n; i++) {
      faktorial *= i;
    }
    return faktorial;
  }
}

Future<void> main() async {
  int input = 5;
  int hasilFaktorial = await Hitung(input);
  print("Nilai yang di input  : $input");
  print("Hasil Faktorialnya   : $hasilFaktorial");
}
