void main() {
  int nilai = 20;

  String hasil = "";

  if (nilai > 70) {
    hasil = "Nilai A";
  } else if (nilai > 40) {
    hasil = "Nilai B";
  } else if (nilai > 0) {
    hasil = "Nilai C";
  }

  print(hasil);
}
