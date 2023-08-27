void main() {
  List<List<dynamic>> elemen = [
    ['Diamond Lock', 230],
    ['World Lock', 150],
    ['Small Lock', 75],
  ];

  Map<String, int> mapElemen =
      Map.fromEntries(elemen.map((item) => MapEntry(item[0], item[1])));

  print("Hasil List: $elemen");
  print("Hasil Map: $mapElemen");