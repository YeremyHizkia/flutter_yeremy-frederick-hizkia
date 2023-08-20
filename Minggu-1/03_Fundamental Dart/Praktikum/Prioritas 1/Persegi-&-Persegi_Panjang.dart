void main() {
//Persegi
  double sisi = 5.0;
  double diameter = 4 * sisi;
  double Luas_Persegi = sisi * sisi;

//Persegi Panjang
  double Panjang = 6.0;
  double Lebar = 4.0;

  double Keliling = 2 * (Panjang + Lebar);
  double Luas = Panjang * Lebar;

  print("Berikut adalah hasil perhitungannya:");
  print("");
  print("Keliling Persegi: $diameter, Luas Persegi: $Luas_Persegi");
  print("Keliling Persegi Panjang: $Keliling, Luas Persegi Panjang: $Luas");
}
